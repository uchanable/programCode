//
//  AttendanceManagementView.swift
//  timecardBluetooth
//
//  Created by 임유찬 on 2024/02/28.
//

import SwiftUI

struct AttendanceManagementView: View {
    var onActionSelect: (AppState) -> Void
    
    var body: some View {
        List {
            Button("出勤") { onActionSelect(.checkIn) }
            Button("退勤") { onActionSelect(.checkOut) }
            Button("休み") { onActionSelect(.breakStart) }
            Button("働く") { onActionSelect(.breakEnd) }
            Button("修正") { onActionSelect(.attendanceCorrection) }
            Button("登録") { onActionSelect(.addStaff) }
        }
    }
}
