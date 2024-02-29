//
//  ContentView.swift
//  timecardSystem
//
//  Created by 임유찬 on 2024/02/02.
//

import SwiftUI

struct ContentView: View {
    var nfcManager = NFCManager()
    
    var body: some View {
        VStack {
            Button("Read NFC Tag") {
                nfcManager.beginSession()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}

// 밑에꺼는 그냥 프리뷰 보게해주는 코드인듯
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
