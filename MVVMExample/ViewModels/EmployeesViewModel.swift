//
//  EmployeesViewModel.swift
//  MVVMExample
//
//  Created by Marcos Jr on 08/04/21.
//

import Foundation

class EmployeesViewModel: NSObject {
    
    private var apiService: APIService!
    private(set) var empData: Employees! {
        didSet {
            self.bindEmployeeViewModelToController()
        }
    }
    
    var bindEmployeeViewModelToController: (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService = APIService()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.apiService.apiToGetEmployeeData { (empData) in
            print(empData)
        }
    }
}
