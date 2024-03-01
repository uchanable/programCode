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
    @State private var isLoading = false // 로딩 상태를 나타내는 상태 변수 추가
    
    var body: some View {
        ZStack{
            if isLoading{
                // 로딩 화면 표시
                Text("Loading...")
                    .transition(.opacity) // 등장과 사라짐에 투명도 변화를 적용
            } else {
                switch appState {
                case .initial:
                    InitialView(bluetoothViewModel: bluetoothViewModel)
                        .transition(.opacity) // 화면 전환에 슬라이드 효과 적용
                case .attendanceManagement:
                    AttendanceManagementView(bluetoothViewModel:bluetoothViewModel) {
                        appState = $0
                    }
                    .transition(.opacity) // 화면 전환에 슬라이드 효과 적용
                case .checkIn:
                    CheckInView(bluetoothViewModel: bluetoothViewModel) {
                        appState = .attendanceManagement
                    }
                    .transition(.opacity) // 화면 전환에 슬라이드 효과 적용
                case .checkOut:
                    CheckOutView {
                        appState = .attendanceManagement
                    }
                    .transition(.opacity) // 화면 전환에 슬라이드 효과 적용
                case .breakStart:
                    BreakStartView {
                        appState = .attendanceManagement
                    }
                    .transition(.opacity) // 화면 전환에 슬라이드 효과 적용
                case .breakEnd:
                    BreakEndView {
                        appState = . attendanceManagement
                    }
                    .transition(.opacity) // 화면 전환에 슬라이드 효과 적용
                case .attendanceCorrection:
                    AttendanceCorrelationView {
                        appState = .attendanceManagement
                    }
                    .transition(.opacity) // 화면 전환에 슬라이드 효과 적용
                case .addStaff:
                    AddStaffView {
                        appState = .attendanceManagement
                    }
                    .transition(.opacity) // 화면 전환에 슬라이드 효과 적용
                case .gridTest:
                    GridTest01View(bluetoothViewModel: bluetoothViewModel) {
                        appState = .attendanceManagement
                    }
                }
            }
        }
        .animation(.easeInOut, value: appState) // appState 변경에 따른 애니메이션 적용
        .onAppear {
            // 예시로, 화면이 나타날 때 로딩 상태를 true로 변경하고 2초 후에 false로 변경
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isLoading = false
            }
        }
        .onChange(of: bluetoothViewModel.isConnected){
            if !bluetoothViewModel.isConnected{
                bluetoothViewModel.disconnectDevice()
                showBluetoothDisconnectedAlert = true
                startAlertDissmissTimer()
                appState = .initial
            } else {
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

