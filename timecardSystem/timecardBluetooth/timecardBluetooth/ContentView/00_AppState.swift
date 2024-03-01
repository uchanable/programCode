//
//  AppState.swift
//  timecardBluetooth
//
//  Created by 임유찬 on 2024/02/28.
//

import Foundation
import SwiftUI
 

//앱의 화면 상태를 나타내는 열거형
enum AppState{
    case initial                // 초기 로그인 화면
    case attendanceManagement   // 로그인 후 메인 화면
    case checkIn                // 출근 버튼
    case checkOut               // 퇴근 버튼
    case breakStart             // 휴게 시작 버튼
    case breakEnd               // 휴게 끝 버튼
    case attendanceCorrection   // 근태기록 수정 버튼
    case addStaff               // 종업원 등록 화면은 개발 예정
    case gridTest               // Grid 테스트하는 뷰
}
