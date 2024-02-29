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
        VStack{
            Button("Scan for Devices") {
                bluetoothViewModel.scanForDevices()
            }
            .disabled(bluetoothViewModel.isScanning) // 스캔 중이면 비활성화
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
