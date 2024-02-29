//
//  BreakOutView.swift
//  BreakEndView.swift
//  timecardBluetooth
//
//  Created by 임유찬 on 2024/02/28.
//

import SwiftUI

struct BreakEndView: View {
    var onBreakEnd: () -> Void
    
    var body: some View {
        VStack {
            // 휴게 끝 NFC 태그 읽기 화면 구현
            Text("휴게 끝 NFC 태그를 읽어주세요.")
                .padding()
            
            Button("뒤로 가기"){
                onBreakEnd()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}
