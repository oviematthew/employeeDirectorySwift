//
//  Employees.swift
//  EmployeesDirectory
//
//  Created by Matthew Ovie Enamuotor on 13/04/2024.
//

import Foundation
import SwiftUI

struct Employee: Decodable, Identifiable{
    var id: String {uuid}
    let uuid : String
    let full_name : String
    let phone_number : String
    let email_address : String
    let biography : String
    let photo_url_small : String
    let photo_url_large : String
    let team : String
    let employee_type : String
}



