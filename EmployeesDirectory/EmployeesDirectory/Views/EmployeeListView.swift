//
//  EmployeesListView.swift
//  EmployeesDirectory
//
//  Created by Matthew Ovie Enamuotor on 13/04/2024.
//

import SwiftUI

struct EmployeeListView: View {
    @State var viewModel: EmployeeListViewModel
    
    init(viewModel: EmployeeListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView("Fetching Employees...")
                    .progressViewStyle(CircularProgressViewStyle())
            } else {
                listContentView
                    .navigationTitle(viewModel.navTitle)
                    .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Employee")
                    .refreshable {
                        await viewModel.fetchEmployees()
                    }
            }
        }
        .onAppear() {
            Task {
                await viewModel.fetchEmployees()
            }
        }
    }
    
    @ViewBuilder
    var listContentView: some View {
        List(viewModel.employees) { employee in
            NavigationLink(destination: EmployeeDetailView(employee: employee)) {
                EmployeeRowView(employee: employee)
            }
            
        }
    }
}

#Preview {
    EmployeeListView(viewModel: EmployeeListViewModel(service: EmployeeService()))
}
