//
//  CheckOutView.swift
//  timecardBluetooth
//
//  Created by 임유찬 on 2024/02/28.
//

import SwiftUI
 
struct CheckOutView: View {
    var onCheckOut: () -> Void
    
    var body: some View {
        VStack {
            // 퇴근 NFC 태그 읽기 화면 구현
            Text("퇴근 NFC 태그를 읽어주세요.")
                .padding()
            
            Button("뒤로 가기"){
                onCheckOut()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}
