//
//  ViewController.swift
//  MVVMExample
//
//  Created by Marcos Jr on 08/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var employeeTableView: UITableView!
    
    private var employeesViewModel: EmployeesViewModel!
    
    private var dataSource: EmployeeTableViewDataSource<EmployeeTableViewCell,EmployeeData>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func callViewModelForUIUpdate() {
        self.employeesViewModel = EmployeesViewModel()
        self.employeesViewModel.bindEmployeeViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource(){
        
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "EmployeeTableViewCell", items: self.employeesViewModel.empData.data, configureCell: { (cell, evm) in
            cell.employeeIdLabel.text = evm.id
            cell.employeeNameLabel.text = evm.employeeName
        })
        
        DispatchQueue.main.async {
            self.employeeTableView.dataSource = self.dataSource
            self.employeeTableView.reloadData()
        }
    }

}

