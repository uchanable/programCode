//
//  AddStaffView.swift
//  timecardBluetooth
//
//  Created by 임유찬 on 2024/02/28.
//

import SwiftUI

struct GridTest01View: View {
    @ObservedObject var bluetoothViewModel: BluetoothViewModel
    var onActionSelect: () -> Void

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("2024年 3月 1日 水曜日") // 날짜 표시
                        .font(.caption)
                    Text("16:37:52") // 시간 표시
                        .font(.largeTitle)
                }

                Spacer() // 좌우 요소 사이에 공간 추가

                VStack {
                    Text("Today's")
                    Text("Staff List")
                }
                .frame(width: 100) // 오른쪽 바의 너비 설정
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))

            Text("Text Grid") // 중앙 큰 텍스트 영역
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                .padding(.horizontal)

            // 아래의 버튼 그리드
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                ForEach(0..<4) { index in // 더미 데이터로 4개의 버튼 생성
                    Button("Button \(index)") {
                        // 버튼 액션 처리
                    }
                    .frame(height: 100) // 버튼 높이 설정
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                }
            }
            .padding()

            Spacer() // 나머지 공간을 차지하도록
        }
    }
}
