//
//  SettingsView.swift
//  EmployeesDirectory
//
//  Created by Matthew Ovie Enamuotor on 13/04/2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack{
            Text("Employee App")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Spacer()
            Text("This app gets employee data from an api and parses the data onto a list and detail view, tap on Employees tab for more")
                .multilineTextAlignment(.center)
                .padding()
                
            Spacer()
            Text("Matthew Ovie Enamuotor")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("1146253")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)

        }
    }
}

#Preview {
    SettingsView()
}
