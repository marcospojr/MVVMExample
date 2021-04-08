//
//  Employee.swift
//  MVVMExample
//
//  Created by Marcos Jr on 08/04/21.
//

import Foundation

// MARK: - Employee
struct Employees: Decodable {
    let status: String
    let data: [EmployeeData]
}

// MARK: - EmployeeData
struct EmployeeData: Decodable {
    let id, employeeName, employeeSalary, employeeAge: String
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
