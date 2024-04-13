//
//  EmployeeListViewModel.swift
//  EmployeesDirectory
//
//  Created by Matthew Ovie Enamuotor on 13/04/2024.
//

import Foundation
import Observation

@Observable
final class EmployeeListViewModel: ObservableObject{
    private let service: EmployeeService
    private(set) var employees: [Employee] = []
    var searchResults: [Employee] = []
    private(set) var isLoading: Bool = false
    var navTitle: String = ""
    var searchText: String = ""
    
    init(service: EmployeeService, navTitle: String = "Employees") {
        self.service = service
        self.navTitle = navTitle
    }
    
    @MainActor
    func fetchEmployees() async {
        do {
            isLoading = true
            employees = try await service.fetchEmployees()
            isLoading = false
        }catch{
            print("Error in ListVM: \(error)")
        }
    }
    
    // Search for employee
    func searchEmployee() {
        searchResults = employees.filter({ $0.full_name.localizedCaseInsensitiveContains(searchText) })
    }
    
}
