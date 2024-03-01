//
//  ContentView.swift
//  layoutPractice
//
//  Created by 임유찬 on 2024/03/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            VStack (alignment: .leading) {
                Text("오늘의 스태프")
                    .foregroundStyle(Color.black)
                    .font(.system(size: 23))
                    .fontWeight(.bold
                    )
                    .padding(10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Circle().frame(height:100)
                        .foregroundStyle(Color(hex: "FFFFFF"))
                        .padding(10)
                        .shadow(radius: 5, y: 3)
                        .overlay(
                            Circle()
                                .stroke(lineWidth: 4)
                                .frame(height:100)
                                .foregroundColor(Color(hex: "#FF5034"))
                            )
                    
                        Circle().frame(height:100)
                        .foregroundStyle(Color(hex: "FFFFFF"))
                        .padding(10)
                        .shadow(radius: 5, y: 3)
                        .overlay(
                            Circle()
                                .stroke(lineWidth: 4)
                                .frame(height:100)
                                .foregroundColor(Color(hex: "#FF5034"))
                            )
                        
                        Circle().frame(height:100)
                        .foregroundStyle(Color(hex: "FFFFFF"))
                        .padding(10)
                        .shadow(radius: 5, y: 3)
                        .overlay(
                            Circle()
                                .stroke(lineWidth: 4)
                                .frame(height:100)
                                .foregroundColor(Color(hex: "#FF5034"))
                            )
                        
                        Circle().frame(height:100)
                        .foregroundStyle(Color(hex: "FFFFFF"))
                        .padding(10)
                        .shadow(radius: 5, y: 3)
                        .overlay(
                            Circle()
                                .stroke(lineWidth: 4)
                                .frame(height:100)
                                .foregroundColor(Color(hex: "#FF5034"))
                            )
                        
                        Circle().frame(height:100)
                        .foregroundStyle(Color(hex: "FFFFFF"))
                        .padding(10)
                        .shadow(radius: 5, y: 3)
                        .overlay(
                            Circle()
                                .stroke(lineWidth: 4)
                                .frame(height:100)
                                .foregroundColor(Color(hex: "#FF5034"))
                                .opacity(0.5)
                            )
                        
                        Circle().frame(height:100)
                        .foregroundStyle(Color(hex: "FFFFFF"))
                        .padding(10)
                        .shadow(radius: 5, y: 3)
                        .overlay(
                            Circle()
                                .stroke(lineWidth: 4)
                                .frame(height:100)
                                .foregroundColor(Color(hex: "#FF5034"))
                                .opacity(0.5)
                            )
                        
                        Circle().frame(height:100)
                        .foregroundStyle(Color(hex: "FFFFFF"))
                        .padding(10)
                        .shadow(radius: 5, y: 3)
                        .overlay(
                            Circle()
                                .stroke(lineWidth: 4)
                                .frame(height:100)
                                .foregroundColor(Color(hex: "#707070"))
                                .opacity(0.2)
                            )
                        
                        Circle().frame(height:100)
                        .foregroundStyle(Color(hex: "FFFFFF"))
                        .padding(10)
                        .shadow(radius: 5, y: 3)
                        .overlay(
                            Circle()
                                .stroke(lineWidth: 4)
                                .frame(height:100)
                                .foregroundColor(Color(hex: "#707070"))
                                .opacity(0.2)
                            )
                        
                        Circle().frame(height:100)
                        .foregroundStyle(Color(hex: "FFFFFF"))
                        .padding(10)
                        .shadow(radius: 5, y: 3)
                        .overlay(
                            Circle()
                                .stroke(lineWidth: 4)
                                .frame(height:100)
                                .foregroundColor(Color(hex: "#707070"))
                                .opacity(0.2)
                            )
                        /*
                        ForEach(0..<4, content: { index in
                            Circle().frame(height:100)
                        })
                        .foregroundStyle(Color(hex: "FFFFFF"))
                        .padding(10)
                        .shadow(radius: 5, y: 3)
                        .overlay(
                            Circle()
                                .stroke(lineWidth: 2)
                                .frame(height:100)
                                .foregroundColor(Color(hex: "#FF7042"))
                        )
                         */
                    }
                    
                }
            }
            .padding(.horizontal, 40)
            .padding(.top,20)
            HStack {
                timeClock().frame(height:300)
                VStack(alignment: .trailing){

                    Image("1")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .cornerRadius(50)
                        .padding(.trailing, 15)
                        .padding(.bottom, 10)
                    Text("NFC 카드 리딩 성공")
                        .padding(.trailing, 15)
                    Text("스태프 이름 : 임유찬")
                        .padding(.trailing, 15)
                        .font(.system(size: 23))
                        .fontWeight(.bold)
                }
                .padding(.leading ,130)
            }
            .padding(.vertical, 20)
            VStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        Text("출근")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .frame(width: 200, height: 200, alignment: .center)
                            .background(Color(hex: "#FF5034"))
                            .foregroundColor(.white)
                            .cornerRadius(50)
                            .padding(10)
                            .shadow(radius:3, y:3)
                        Text("퇴근")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .frame(width: 200, height: 200, alignment: .center)
                            .background(Color(hex: "#FFFFFF"))
                            .foregroundColor(Color(hex: "#707070"))
                            .cornerRadius(50)
                            .padding(10)
                            .shadow(radius:3, y:3)
                        Text("휴게\n시작")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .frame(width: 200, height: 200, alignment: .center)
                            .background(Color(hex: "#FFFFFF"))
                            .foregroundColor(Color(hex: "#707070"))
                            .cornerRadius(50)
                            .padding(10)
                            .shadow(radius:3, y:3)
                        Text("휴게\n종료")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .frame(width: 200, height: 200, alignment: .center)
                            .background(Color(hex: "#FFFFFF"))
                            .foregroundColor(Color(hex: "#707070"))
                            .cornerRadius(50)
                            .padding(10)
                            .shadow(radius:3, y:3)
                        Text("종업원\n등록")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .frame(width: 200, height: 200, alignment: .center)
                            .background(Color(hex: "#2A2E47"))
                            .foregroundColor(Color(hex: "#FFFFFF"))
                            .cornerRadius(50)
                            .padding(10)
                            .shadow(radius:3, y:3)
                        Text("관리자\n전용")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .frame(width: 200, height: 200, alignment: .center)
                            .background(Color(hex: "#2A2E47"))
                            .foregroundColor(Color(hex: "#FFFFFF"))
                            .cornerRadius(50)
                            .padding(10)
                            .shadow(radius:3, y:3)
                    }
                }
            }
            // .background(Color.white)
            .padding(.horizontal, 40)
            Spacer()
        }
        // .background(Color.red)
        .background(Color(hex: "F2F4F6").ignoresSafeArea())
    }
}

#Preview {
    ContentView()
}

/*
 
 */
