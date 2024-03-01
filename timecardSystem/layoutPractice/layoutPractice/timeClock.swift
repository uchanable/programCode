//
//  timeClock.swift
//  layoutPractice
//
//  Created by 임유찬 on 2024/03/01.
//

import SwiftUI
import Foundation
import UIKit


extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        print(cleanHexCode)
        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}

struct timeClock: View {
    
    @State var nowDate = Date()
    @State var dateText = ""
    @State var timeText = ""
    private let dateFormatter = DateFormatter()
    private let timeFormatter = DateFormatter()

    init() {
        dateFormatter.dateFormat = "YYYY/MM/dd"
        dateFormatter.locale = Locale(identifier: "ja_jp")
        timeFormatter.dateFormat = "HH:mm:ss"
        timeFormatter.locale = Locale(identifier: "ja_jp")
    }
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            // Rectangle().frame(height: 0)
            // Text(Date.now, style: .date)
            // Text(Date.now, style: .relative)
            // Text(Date.now, style: .time)
            // Spacer()
            // Rectangle().frame(height:0)
            Text(dateText.isEmpty ? "\(dateFormatter.string(from: nowDate))" : dateText)
                //.font(.title)
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                        self.nowDate = Date()
                        dateText = "\(dateFormatter.string(from: nowDate))"
                    }
                }
                .font(.custom("DS-Digital", size: 50))
                //.foregroundStyle(Color(hex: "#F4F4FB"))
                .fontWeight(.heavy)
                //.shadow(radius: 3)
                .padding(.top, 20)
            
            Text(timeText.isEmpty ? "\(timeFormatter.string(from: nowDate))" : timeText)
                .font(.custom("DS-Digital", size: 200))
                .fontWeight(.black)
                //.foregroundStyle(Color(hex: "#F4F4FB"))
                //.shadow(radius: 3)
                .onReceive(timer) { _ in
                    self.nowDate = Date()
                    timeText = "\(timeFormatter.string(from: nowDate))"
                }
            
            /*
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                        self.nowDate = Date()
                        timeText = "\(timeFormatter.string(from: nowDate))"
                    }
                }*/
            
            // Spacer()
        }
        //.padding(50)
        //.background(Color(hex: "#5e69ee"))
        .cornerRadius(20)
        //.shadow(radius: 3)
    }
}
/*
let date = date()
let formatter = DateFormatter()
formatter.dateStyle = .full
formatter.timeStyle = .medium
 
*/

#Preview {
    timeClock()
}
