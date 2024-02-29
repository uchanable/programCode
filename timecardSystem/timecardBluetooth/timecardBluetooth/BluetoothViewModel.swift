//
//  BluetoothViewModel.swift
//  timecardBluetooth
//
//  Created by 임유찬 on 2024/02/26.
//
import Foundation
import CoreBluetooth

extension Data {
    func hexEncodedString() -> String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
}

extension Character {
    // 문자가 16진수 숫자를 나타내는지 확인하고 해당 값을 반환
    var hexDigitValue: Int? {
        return Int(String(self), radix: 16)
    }
}

class BluetoothViewModel: NSObject, ObservableObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    var centralManager: CBCentralManager!
    @Published var isConnected = false {
        didSet {
            // 연걸 상태가 변경될 때마다 Alert 표시 상태도 초기화
            showDisconnectAlert = false
        }
    }
    @Published var discoveredDevices = [String]() // 발견된 디바이스의 이름을 저장할 배열
    @Published var shouldShowConnectAlert = false // 연결 확인 Alert를 표시할지 결정하는 플래그
    @Published var showDisconnectAlert = false // 연결 해제 확인 Alert 표시 제어
    @Published var receivedUID = "" // NFC 태그 UID 저장
    @Published var isScanning = false // 스캔 중인지 여부
    @Published var showScanFailedAlert = false // 스캔 실패 Alert 표시 제어

    var peripherals = [CBPeripheral]() // 발견된 디바이스를 저장할 배열
    var targetPeripheral: CBPeripheral? // 연결하려는 대상 디바이스에 대한 참조
    var scanTimer: Timer? // 스캔 타이머

    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: DispatchQueue.main)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            print("Bluetooth is powered on and ready.")
        } else {
            print("Bluetooth is not available.")
        }
    }

    func scanForDevices() {
        guard !isScanning, centralManager.state == .poweredOn else { return }
        isScanning = true
        discoveredDevices.removeAll() // 스캔 시작 전에 발견된 디바이스 목록을 초기화
        centralManager.scanForPeripherals(withServices: nil, options: nil)
        print("Scanning started...")
        
        // 스캔 타임아웃을 설정합니다. 5초 후에 실행될 클로저를 정의합니다.
        scanTimer?.invalidate() // 이전에 설정된 타이머가 있다면 취소합니다.
        scanTimer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { [weak self] _ in
            guard let self = self else { return }
            if !self.isConnected && self.shouldShowConnectAlert == false {
                // 원하는 블루투스 디바이스를 찾지 못한 경우
                print("Bluetooth device detection failed.")
                self.stopScanning() // 스캔을 중지합니다.
                DispatchQueue.main.async {
                    self.showScanFailedAlert = true // 스캔 실패 Alert 표시
                    self.isScanning = false
                }
            }
        }
    }
    
    func stopScanning() {
        centralManager.stopScan()
        isScanning = false
        print("Scanning stopped.")
    }
    

    
    func disconnectDevice() {
        guard let peripheral = targetPeripheral else { return }
        centralManager.cancelPeripheralConnection(peripheral)
        isConnected = false
        isScanning = false // 연결 해제 후 스캔을 다시 시작할 수 있도록 준비
        targetPeripheral = nil // 현재 연결된 장치 참조 해제
        clearReceivedUID() // UID 초기화
        DispatchQueue.main.async {
            self.showDisconnectAlert = false
        }
    }

    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String: Any], rssi RSSI: NSNumber) {
        // 장치 발견 로직은 유지하되, 연결하려는 장치 발견 시 shouldShowConnectAlert 업데이트
        if let name = peripheral.name, !discoveredDevices.contains(name) {
            print("Discovered \(name) at \(RSSI)")
            if name == "REYAX_BLE_RYB080I" {
                centralManager.stopScan()
                isScanning = false // 스캔 중지
                targetPeripheral = peripheral
                shouldShowConnectAlert = true // 사용자에게 연결 확인 Alert 표시
            }
        }
    }

    // 연결 실패 및 해제 처리
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("Failed to connect to \(peripheral.name ?? "")")
    }
    // 연결 해제 메서드 추가
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        isConnected = false
        isScanning = false // 여기도 상태 업데이트
        print("Disconnected from \(peripheral.name ?? "")")
    }
    
    // Peripheral이 연결되었을 때 호출되는 메서드 내에 추가
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        isConnected = true
        isScanning = false // 연결되었으므로 스캔 중지
        targetPeripheral = peripheral
        print("Connected to \(peripheral.name ?? "")")
        peripheral.delegate = self // 중요: Peripheral의 델리게이트 설정
        peripheral.discoverServices(nil) // 필요한 서비스 발견 시작
    }

    // 서비스를 발견했을 때 호출되는 메서드
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if let error = error {
            print("Error discovering services: \(error.localizedDescription)")
            return
        }
        
        guard let services = peripheral.services else { return }
        for service in services {
            peripheral.discoverCharacteristics(nil, for: service) // 서비스 내의 특성 발견 시작
        }
    }
    
    // 특성을 발견했을 때 호출되는 메서드
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if let error = error {
            print("Error discovering characteristics: \(error.localizedDescription)")
            return
        }
        
        guard let characteristics = service.characteristics else { return }
        for characteristic in characteristics {
            if characteristic.properties.contains(.read) {
                peripheral.readValue(for: characteristic) // 특성의 값을 읽음
            }
            if characteristic.properties.contains(.notify) {
                peripheral.setNotifyValue(true, for: characteristic) // 데이터 변경 알림 구독
            }
        }
    }
    
    func parseReceivedData(_ data: String) -> String {
        // 문자열을 2자리 16진수로 분리
        let hexPairs = stride(from: 0, to: data.count - 2, by: 2).map {
            data.index(data.startIndex, offsetBy: $0)..<data.index(data.startIndex, offsetBy: $0 + 2)
        }
        // 16진수 문자열을 실제 16진수 값으로 변환하고, 이를 ASCII 문자로 변환
        let asciiCharacters = hexPairs.compactMap { UInt8(data[$0], radix: 16) }.map { Character(UnicodeScalar($0)) }
        // ASCII 문자 배열을 문자열로 변환
        let asciiString = String(asciiCharacters)
        // ASCII 문자열을 다시 16진수 값으로 해석하여 최종 UID 문자열을 생성
        let uid = asciiString.compactMap { $0.hexDigitValue }.map { String(format: "%X", $0) }.joined()
        return uid
    }

    
    // 특성의 값이 업데이트되었을 때 호출되는 메서드
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if let error = error {
            print("Error updating value for characteristic: \(error.localizedDescription)")
            return
        }

        guard let value = characteristic.value else { return }
        let receivedDataString = value.hexEncodedString() // Data를 16진수 문자열로 변환
        let uid = parseReceivedData(receivedDataString)

        DispatchQueue.main.async {
            self.receivedUID = uid
        }
    }
    
    func clearReceivedUID(){
        receivedUID = ""
    }

    
}

