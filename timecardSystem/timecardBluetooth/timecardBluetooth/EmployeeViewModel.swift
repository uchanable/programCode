//
//  EmployeeViewModel.swift
//  timecardBluetooth
//
//  Created by 임유찬 on 2024/02/28.
//

import Foundation


struct Employee: Codable, Identifiable {
    var id: String // UID를 ID로 사용
    var employeeNumber: String?
    var name: String?
}

class EmployeeViewModel: ObservableObject {
    @Published var employees: [Employee] = []
    @Published var receivedUID = "" {
        didSet {
            // UID가 수신될 때마다 종업원 정보 업데이트
  //          updateEmployeeInfo(forUID: receivedUID)
        }
    }
    
    init() {
        loadEmployees()
    }
    
    func loadEmployees() {
        // UserDefaults에서 종업원 정보 로드
        if let data = UserDefaults.standard.data(forKey: "employees"),
           let employees = try? JSONDecoder().decode([Employee].self, from: data) {
            self.employees = employees
        }
    }
    
    func saveEmployees() {
        // 종업원 정보를 UserDefaults에 저장
        if let data = try? JSONEncoder().encode(employees) {
            UserDefaults.standard.set(data, forKey: "employees")
        }
    }
    
    // 등록, 수정, 삭제 로직 추가
    func addOrUpdateEmployee(uid: String, employeeNumber: String?, name: String?) {
        if let index = employees.firstIndex(where: { $0.id == uid }) {
            // 기존 종업원 정보 업데이트
            employees[index].employeeNumber = employeeNumber
            employees[index].name = name
        } else {
            // 새로운 종업원 정보 추가
            let newEmployee = Employee(id: uid, employeeNumber: employeeNumber, name: name)
            employees.append(newEmployee)
        }
        saveEmployees()
    }
    
    func deleteEmployee(forUID uid: String) {
        employees.removeAll { $0.id == uid }
        saveEmployees()
    }
    
}
