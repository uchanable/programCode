//
//  MyProjectCard.swift
//  layoutPractice
//
//  Created by 임유찬 on 2024/03/01.
//

import SwiftUI

struct MyProjectCard : View{
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 0){
                Rectangle().frame(height: 20)
                    .cornerRadius(20)
                    .padding(.vertical, 20)
                Text("출퇴근 기록 시스템")
                    .font(.system(size: 23))
                    .fontWeight(.black)
                    //.padding(.bottom)
                Text("스태프 카드를 대주세요")
                    .foregroundStyle(.secondary)
                Spacer().frame(height:20)
                HStack{
                    Image("1")
                        .resizable()
                        .frame(width:100, height:100)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(lineWidth: 5)
                                .foregroundColor(.gray)
                        )
                    Circle().frame(width:100, height:100)
                    Circle().frame(width:100, height:100)
                    Circle().frame(width:100, height:100)
                    
                    Spacer()
                    
                    Text("OK")
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(10)
                        .frame(width: 80, height: 50)
                        .background(Color.blue)
                        .cornerRadius(20)
                }
            }
            .padding(50)
            .background(Color.yellow)
            .cornerRadius(20)
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        
            VStack(alignment: .leading, spacing: 0){
                Rectangle().frame(height: 20)
                    .cornerRadius(20)
                    .padding(.vertical, 20)
                Text("출퇴근 기록 시스템")
                    .font(.system(size: 23))
                    .fontWeight(.black)
                    //.padding(.bottom)
                Text("스태프 카드를 대주세요")
                    .foregroundStyle(.secondary)
                Spacer().frame(height:20)
                HStack{
                    Image("1")
                        .resizable()
                        .frame(width:100, height:100)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(lineWidth: 5)
                                .foregroundColor(.gray)
                        )
                    Circle().frame(width:100, height:100)
                    Circle().frame(width:100, height:100)
                    Circle().frame(width:100, height:100)
                    
                    Spacer()
                    
                    Text("OK")
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(10)
                        .frame(width: 80, height: 50)
                        .background(Color.blue)
                        .cornerRadius(20)
                }
            }
            .padding(50)
            .background(Color.yellow)
            .cornerRadius(20)
            .padding(.horizontal, 20)
        }
    }
}

struct MyProjectCard_Previews: PreviewProvider{
    static var previews: some View{
        MyProjectCard()
    }
}


