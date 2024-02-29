//
//  ContentView.swift
//  timecardBluetooth
//
//  Created by 임유찬 on 2024/02/26.
//

// git add .
// git commit -m ""
// git push
// git status
// git pull
 
import SwiftUI

struct ContentView: View {
    @StateObject private var bluetoothViewModel = BluetoothViewModel()
    @State private var appState: AppState = .initial
    @State private var alertDismissTimer: Timer?
    @State private var showBluetoothDisconnectedAlert = false
    
    var body: some View {
        switch appState {
        case .initial:
            InitialView(bluetoothViewModel: bluetoothViewModel)
                .onChange(of: bluetoothViewModel.isConnected) {
                    if bluetoothViewModel.isConnected {
                        appState = .attendanceManagement
                    }
                }
            
                .alert(isPresented: $showBluetoothDisconnectedAlert){
                    Alert(
                        title: Text("Bluetooth 연결 해제"),
                        message: Text("블루투스 연결이 해제되었습니다."),
                        dismissButton: .default(Text("확인"))
                    )
                }
        case .attendanceManagement:
            AttendanceManagementView(bluetoothViewModel:bluetoothViewModel) {
                appState = $0
            }
            .onChange(of: bluetoothViewModel.isConnected){
                if !bluetoothViewModel.isConnected{
                    bluetoothViewModel.disconnectDevice()
                    showBluetoothDisconnectedAlert = true
                    startAlertDissmissTimer()
                    appState = .initial
                }
            }
            
        case .checkIn:
            CheckInView(bluetoothViewModel: bluetoothViewModel) {
                appState = .attendanceManagement
            }
        case .checkOut:
            CheckOutView {
                appState = .attendanceManagement
            }
        case .breakStart:
            BreakStartView {
                appState = .attendanceManagement
            }
        case .breakEnd:
            BreakEndView {
                appState = . attendanceManagement
            }
        case .attendanceCorrection:
            AttendanceCorrelationView {
                appState = .attendanceManagement
            }
        case .addStaff:
            AddStaffView {
                appState = .attendanceManagement
            }
            
        }
    }
    private func startAlertDissmissTimer() {
        alertDismissTimer?.invalidate() // Timer 초기화
        alertDismissTimer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) {
            _ in showBluetoothDisconnectedAlert = false
        }
    }
    
}

/*
struct ContentView: View {
    @StateObject private var bluetoothViewModel = BluetoothViewModel()
    @State private var selectedIndex = 0

    var body: some View {
        TabView(selection: $selectedIndex) {
            ScanForDevicesView(bluetoothViewModel: bluetoothViewModel)
                .tag(0) // 첫 번째 화면에 태그 지정
                .tabItem { Text("Scan") }
            
            DeviceConnectedView(bluetoothViewModel: bluetoothViewModel)
                .tag(1) // 두 번째 화면에 태그 지정
                .tabItem { Text("Connected") }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // 쓸어넘기기 효과 적용, 페이지 인디케이터를 숨김
        .onChange(of: bluetoothViewModel.isConnected) { _ in
            selectedIndex = bluetoothViewModel.isConnected ? 1 : 0
        }

        // 연결 상태에 따라 선택된 인덱스 변경
    }
}
*/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


