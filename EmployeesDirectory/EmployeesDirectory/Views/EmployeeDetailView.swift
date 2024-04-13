//
//  EmployeeDetailView.swift
//  EmployeesDirectory
//
//  Created by Matthew Ovie Enamuotor on 13/04/2024.
//

import SwiftUI

struct EmployeeDetailView: View {
    var employee: Employee
    @State private var largeImageUrl: URL?
    
    var body: some View {
        VStack {
            if let url = largeImageUrl{
                AsyncImage(url: url) {image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                }placeholder: {
                    ProgressView()
                }
                
            }
            
            // Display employee details
            HStack{
                Text("Name:")
                Spacer()
                Text(employee.full_name)
            }
            .padding()
            Divider()
            
            HStack{
                Text("Phone:")
                Spacer()
                Text(employee.phone_number)
            }
            .padding()
            Divider()
            
            HStack{
                Text("Email:")
                Spacer()
                Text(employee.email_address)
            }
            .padding()
            Divider()
            
            HStack{
                Text("Bio:")
                Spacer()
                Text(employee.biography)
            }
            .padding()
            Divider()
            
            HStack{
                Text("Team:")
                Spacer()
                Text(employee.team)
            }
            .padding()
            Divider()
            
            HStack{
                Text("Type:")
                Spacer()
                Text(EmployeeType(rawValue: employee.employee_type)?.contractType ?? "")
            }
            .padding()
            
        }
        .onAppear {
            // Set the large image URL
            if let url = URL(string: employee.photo_url_large) {
                largeImageUrl = url
            }
        }
        .padding()
        
    }
    
}

enum EmployeeType: String {
    case fullTime = "FULL_TIME"
    case partTime = "PART_TIME"
    case contractor = "CONTRACTOR"
    
    var contractType: String {
        switch self {
        case .fullTime:
            return "Full Time"
        case .partTime:
            return "Part Time"
        case .contractor:
            return "Contractor"
        }
    
    }
    
}

#Preview {
    EmployeeDetailView(employee: Employee(uuid: "0d8fcc12-4d0c-425c-8355-390b312b909c", full_name: "Justine Mason", phone_number: "5553280123", email_address: "jmason.demo@squareup.com", biography: "Engineer on the Point of Sale team.", photo_url_small: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/small.jpg", photo_url_large: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/large.jpg", team: "Point of Sale", employee_type: "FULL_TIME"))
    
}
