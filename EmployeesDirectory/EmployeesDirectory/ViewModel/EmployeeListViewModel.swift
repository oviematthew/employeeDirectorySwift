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
    private(set) var cachedEmployees: [Employee] = []
    private(set) var isLoading: Bool = false
    var navTitle: String = ""
    var searchText: String = ""
    var searchResults: [Employee] = []
    
    init(service: EmployeeService, navTitle: String = "Employees") {
        self.service = service
        self.navTitle = navTitle
    }
    
    @MainActor
    func fetchEmployees() async {
        do {
            isLoading = true
            employees = try await service.fetchEmployees()
            
            //add to cache
            cachedEmployees = employees
            isLoading = false
        }catch{
            print("Error in ListVM: \(error)")
        }
    }
    
    // Method to update employees array with cached data
    func updateEmployeesWithCachedData() {
        employees = cachedEmployees
    }
    
    // Search for employee
    func filterEmployees() {
        searchResults = employees.filter({ $0.full_name.localizedCaseInsensitiveContains(searchText) })
    }
    
}
