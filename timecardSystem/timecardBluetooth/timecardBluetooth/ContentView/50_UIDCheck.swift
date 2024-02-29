//
//  DeviceConnectedView.swift
//  AttendanceManagementView.swift
//  UIDCheck.swift
//  timecardBluetooth
//
//  Created by 임유찬 on 2024/02/28.
//

import SwiftUI

struct UIDCheck: View {
    @ObservedObject var bluetoothViewModel: BluetoothViewModel

    var body: some View {
        VStack {
            Text("Received UID: \(bluetoothViewModel.receivedUID)")
                .padding()

            Button("Disconnect Device") {
                bluetoothViewModel.disconnectDevice()
            }
            .padding()
        }
    }
}
