//
//  EmployeeService.swift
//  EmployeesDirectory
//
//  Created by Matthew Ovie Enamuotor on 13/04/2024.
//

import Foundation
protocol EmployeeServiceType{
func fetchEmployees() async throws -> [Employee]
}

final class EmployeeService: EmployeeServiceType {
    
    struct Path {
        static let employeesUrl = "https://s3.amazonaws.com/sq-mobile-interview/employees.json"
    }
    
    func fetch<T>(type: T.Type, from urlString: String) async -> T? where T : Decodable {
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        do {
            let (data, _) = try await URLSession
                .shared
                .data(from: url)
            let decoder = JSONDecoder()
            
            return try decoder.decode(type, from: data)
        } catch {
            print("Error in employee Service: \(error)")
            return nil
        }
    }
    enum FetchError: Error {
        case noData
    }
    
    func fetchEmployees() async throws -> [Employee] {
        guard let response: EmployeesResponse = await fetch(type: EmployeesResponse.self, from: Path.employeesUrl) else {
            throw FetchError.noData
        }
        return response.employees
    }

}

