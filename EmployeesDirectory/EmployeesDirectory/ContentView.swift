//
//  ContentView.swift
//  EmployeesDirectory
//
//  Created by Matthew Ovie Enamuotor on 11/04/2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboardingRequired3") var onboardingRequired: Bool = true
    
    var body: some View {
        TabView {
            EmployeeListView(viewModel: EmployeeListViewModel(service: EmployeeService()))
            .tabItem { Label("Employees", systemImage: "person.3")
            }
            SettingsView()
                .tabItem { Label ("Settings", systemImage: "gear") }
        }
        .fullScreenCover(isPresented: $onboardingRequired) {
            onboardingRequired = false
        } content: {
            OnboardingView(onboardingRequired: $onboardingRequired)
        }
        
    }
}

#Preview {
    ContentView()
}
