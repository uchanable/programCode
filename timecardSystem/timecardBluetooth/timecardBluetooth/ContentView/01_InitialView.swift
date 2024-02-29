//
//  ScanForDevicesView.swift
//  InitialView.swift //modified
//  timecardBluetooth
//
//  Created by 임유찬 on 2024/02/28.
//

import SwiftUI

struct InitialView: View {
    @ObservedObject var bluetoothViewModel: BluetoothViewModel
    
    var body: some View {
        VStack {
            // 블루투스 연결 상태 표시
            HStack {
                Image(systemName: bluetoothViewModel.isConnected ? "antenna.radiowaves.left.and.right" : "antenna.radiowaves.left.and.right.slash")
                Text(bluetoothViewModel.isConnected ? "Connected" : "Disconnected")
            }
            .padding()

            Button("Scan for Devices") {
                bluetoothViewModel.scanForDevices()
            }
            .disabled(bluetoothViewModel.isScanning) // 스캔 중이면 비활성화
            .padding()
            
            Text(bluetoothViewModel.scanStatus.rawValue)
                .padding()
        }
        
        .alert("Connect to Device", isPresented: $bluetoothViewModel.shouldShowConnectAlert) {
            Button("Confirm", role: .destructive) {
                if let peripheral = bluetoothViewModel.targetPeripheral {
                    bluetoothViewModel.centralManager.connect(peripheral, options: nil)
                }
            }
            Button("Cancel", role: .cancel) {
                bluetoothViewModel.stopScanning()
                bluetoothViewModel.showScanFailedAlert = true
                bluetoothViewModel.shouldShowConnectAlert = false
            }
        } message: {
            Text("Do you want to connect to REYAX_BLE_RYB080I?")
        }
        
        .alert(isPresented: $bluetoothViewModel.showScanFailedAlert) {
                Alert(
                    title: Text("Scan Failed"),
                    message: Text("Could not find the Bluetooth device. Please try again."),
                    dismissButton: .default(Text("OK")) {
                        bluetoothViewModel.showScanFailedAlert = false // Alert 닫기
                    }
                )
            }
    }
    
}
/* alert를 두개 띄우는 방법인데 전혀 제대로 구현되지 않음 따라서 걍 초기화함.
//
//  ScanForDevicesView.swift
//  InitialView.swift //modified
//  timecardBluetooth
//
//  Created by 임유찬 on 2024/02/28.
//

import SwiftUI

struct InitialView: View {
    @ObservedObject var bluetoothViewModel: BluetoothViewModel
    
    var body: some View {
        VStack {
            Button("Scan for Devices") {
                bluetoothViewModel.scanForDevices()
            }
            .disabled(bluetoothViewModel.isScanning)
            .padding()
        }
        .alert(item: $bluetoothViewModel.alertIdentifier) { alertIdentifier in
            switch alertIdentifier.type {
            case .scanFailed:
                return Alert(
                    title: Text("Scan Failed"),
                    message: Text("Could not find the Bluetooth device. Please try again."),
                    dismissButton: .default(Text("OK")) {
                        bluetoothViewModel.handleNone()
                    }
                )
            case .connectToDevice:
                return Alert(
                    title: Text("Connect to Device"),
                    message: Text("Do you want to connect to REYAX_BLE_RYB080I?"),
                    primaryButton: .default(Text("Confirm")) {
                        if let peripheral = bluetoothViewModel.targetPeripheral {
                            bluetoothViewModel.centralManager.connect(peripheral, options: nil)
                        }
                        bluetoothViewModel.handleNone()
                    },
                    secondaryButton: .cancel() {
                        bluetoothViewModel.handleNone()
                        bluetoothViewModel.stopScanning()
                    }
                )
            case .none:
                fatalError("This should never be triggered because 'none' does not generate an alert.")
            }
        }
    }
}




*/
