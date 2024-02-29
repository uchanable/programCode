//
//  CheckInView.swift
//  timecardBluetooth
//
//  Created by 임유찬 on 2024/02/28.
//

import SwiftUI
import AVFoundation

struct CheckInView: View {
    @ObservedObject var bluetoothViewModel: BluetoothViewModel
    var onCheckIn: () -> Void // 뒤로 가기 액션
    @State private var showingConfirmationAlert = false
    @State private var alertMessage = ""
    @State private var timer: Timer?
    @State private var dismissTimer: Timer?
    @State private var soundPlayer: AVAudioPlayer?
    
    var body: some View {
        VStack {
            // 출근 NFC 태그 읽기 화면 구현
            Text("출근 NFC 태그를 읽어주세요.")
                .padding()
            
            Button("뒤로 가기"){
                stopAllTimers()
                onCheckIn()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .onAppear{
            startReadingTimer()
            bluetoothViewModel.clearReceivedUID() // 메인 화면으로 돌아갈 때 UID 초기화
        }
        .onChange(of: bluetoothViewModel.receivedUID) {
            if !bluetoothViewModel.receivedUID.isEmpty {
                restartDismissTimer()
                showingConfirmationAlert = false // 알림을 숨깁니다.
                showingConfirmationAlert = true // 새로운 UID로 알림을 다시 표시합니다.
                alertMessage = "정상 출근"
                playSound(soundName: "complete")
            }
        }
        
        .alert(isPresented: $showingConfirmationAlert) {
            Alert(
                title: Text(bluetoothViewModel.receivedUID),
                message: Text("정상적으로 출근이 기록되었습니다"),
                dismissButton: .default(Text("OK")){
                    showingConfirmationAlert = false
                    bluetoothViewModel.clearReceivedUID() // 메인 화면으로 돌아갈 때 UID 초기화
                    stopAllTimers()
                    onCheckIn()
                }
            )
        }
    }
    
    private func startReadingTimer(){
        timer?.invalidate() // 기존 타이머가 있다면 중지
        timer = Timer.scheduledTimer(withTimeInterval: 15, repeats: false) { _ in
            stopAllTimers()
            bluetoothViewModel.clearReceivedUID() // 메인 화면으로 돌아갈 때 UID 초기화
            onCheckIn() // 15초 후 자동으로 뒤로 가기
        }
    }
    
    private func restartDismissTimer() {
        dismissTimer?.invalidate() // 기존 타이머가 있다면 중지
        dismissTimer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            showingConfirmationAlert = false // 3초 후 자동으로 팝업 닫기
        }
    }
    
    private func playSound(soundName: String) {
        guard let path = Bundle.main.path(forResource: soundName, ofType: "m4a") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            soundPlayer?.play()
        } catch {
            print("효과음 재생 실패")
        }
    }
    
    private func stopAllTimers(){
        timer?.invalidate() // 기존 타이머가 있다면 중지
        dismissTimer?.invalidate() // 기존 타이머가 있다면 중지
    }
}

