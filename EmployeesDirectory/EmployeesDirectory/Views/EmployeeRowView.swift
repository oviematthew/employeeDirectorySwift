//
//  EmployeeRowView.swift
//  EmployeesDirectory
//
//  Created by Matthew Ovie Enamuotor on 13/04/2024.
//

import SwiftUI

struct EmployeeRowView: View {
    var employee: Employee
    @State private var smallImageUrl: URL?
    
    var body: some View {
        HStack {
            if let url = smallImageUrl{
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }placeholder: {
                    ProgressView()
                }
                .frame(width: 50, height: 50)
                                    
            }
            
            
            Text(employee.full_name)
        }
        .onAppear {
            // Set the small image URL
            if let url = URL(string: employee.photo_url_small) {
                smallImageUrl = url
            }
        }
    }
}

#Preview {
    EmployeeRowView(employee: Employee(uuid: "0d8fcc12-4d0c-425c-8355-390b312b909c", full_name: "Justine Mason", phone_number: "5553280123", email_address: "jmason.demo@squareup.com", biography: "Engineer on the Point of Sale team.", photo_url_small: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/small.jpg", photo_url_large: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/large.jpg", team: "Point of Sale", employee_type: "FULL_TIME"))
}
