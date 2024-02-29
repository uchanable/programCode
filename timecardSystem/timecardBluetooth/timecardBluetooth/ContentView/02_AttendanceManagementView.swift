//
//  AttendanceManagementView.swift
//  timecardBluetooth
//
//  Created by 임유찬 on 2024/02/28.
//

import SwiftUI

struct AttendanceManagementView: View {
    @ObservedObject var bluetoothViewModel: BluetoothViewModel
    var onActionSelect: (AppState) -> Void
    @State private var showingUID = false
    @State private var timerUID : Timer?
    
    // 4열 그리드 아이템 설정
    @State private var topGridItems: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    @State private var bottomGridItems: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    
    var body: some View {
        ScrollView {
            
            LazyVGrid(columns: topGridItems, spacing: 20){
                Button("出勤") { onActionSelect(.checkIn) }
                Button("退勤") { onActionSelect(.checkOut) }
                Button("休み") { onActionSelect(.breakStart) }
                Button("働く") { onActionSelect(.breakEnd) }
            }
            .buttonStyle(LargeButtonStyle())
            
            LazyVGrid(columns: bottomGridItems, spacing: 40){
                Button("修正") { onActionSelect(.attendanceCorrection) }
                Button("登録") { onActionSelect(.addStaff) }
                Capsule()
                    .fill(Color.white)
                Capsule()
                    .fill(Color.white)
            }
            .buttonStyle(LargeButtonStyle())
            
            if showingUID {
                Text("UID : \(bluetoothViewModel.receivedUID)")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .onAppear(){
                        startDissmissTimer()
                    }
            }
        }
        .padding()
        .onAppear{
            bluetoothViewModel.clearReceivedUID() // 화면 실행 시 UID 초기화
        }
        
        .onChange(of: bluetoothViewModel.receivedUID){
            if !bluetoothViewModel.receivedUID.isEmpty {
                showingUID = true
            }
        }
    }
    
    private func startDissmissTimer(){
        timerUID?.invalidate()
        timerUID = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            showingUID = false // 3초 후 UID 숨기기
            bluetoothViewModel.clearReceivedUID() // 3초 후 UID 초기화
        }
    }
}

// 큰 버튼 스타일
struct LargeButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 200, height: 200) // 버튼 높이 설정
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(20)
            .font(.headline)
    }
}
