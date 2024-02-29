//
//  AddStaffView.swift
//  timecardBluetooth
//
//  Created by 임유찬 on 2024/02/28.
//

<<<<<<< HEAD
import SwiftUI

struct AddStaffView: View {
    var onAddStaff: () -> Void
    
    var body: some View {
        VStack {
            // 종업원 등록 NFC 태그 읽기 화면 구현
            Text("종업원 등록 NFC 태그를 읽어주세요.")
                .padding()
            
            Button("뒤로 가기"){
                onAddStaff()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}
=======
import Foundation
>>>>>>> d03f1b8d1eefd0c06ee7fc2fc7147d5b94b52b3f
