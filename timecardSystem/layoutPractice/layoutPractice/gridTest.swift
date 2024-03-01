//
//  timeClock.swift
//  layoutPractice
//
//  Created by 임유찬 on 2024/03/01.
//

import SwiftUI
import Foundation
import UIKit


struct gridTest: View {
    
    @State var nowDate = Date()
    @State var dateText = ""
    @State var timeText = ""
    private let dateFormatter = DateFormatter()
    private let timeFormatter = DateFormatter()
    
    var body: some View {
        VStack(){
            Rectangle()
                .foregroundColor(Color(hex: "#F4F4FB"))
                .cornerRadius(20)
                .padding(10)
        }
        .background(Color(hex: "#5e69ee"))
        .cornerRadius(20)
        .shadow(radius: 10)
        //.padding(50)
    }
}

#Preview {
    gridTest()
}
