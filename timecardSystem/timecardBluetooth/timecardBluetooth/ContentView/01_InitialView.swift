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
<<<<<<< HEAD
        VStack{
            Button("Scan for Devices") {
                bluetoothViewModel.scanForDevices()
            }
            .disabled(bluetoothViewModel.isScanning) // 스캔 중이면 비활성화
            .padding()
        }
        
=======
        Button("Scan for Devices") {
            bluetoothViewModel.scanForDevices()
        }
        .disabled(bluetoothViewModel.isScanning) // 스캔 중이면 비활성화
        .padding()
>>>>>>> d03f1b8d1eefd0c06ee7fc2fc7147d5b94b52b3f
        .alert("Connect to Device", isPresented: $bluetoothViewModel.shouldShowConnectAlert) {
            Button("Confirm", role: .destructive) {
                if let peripheral = bluetoothViewModel.targetPeripheral {
                    bluetoothViewModel.centralManager.connect(peripheral, options: nil)
                }
            }
<<<<<<< HEAD
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
=======
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Do you want to connect to REYAX_BLE_RYB080I?")
        }
>>>>>>> d03f1b8d1eefd0c06ee7fc2fc7147d5b94b52b3f
    }
    
}
