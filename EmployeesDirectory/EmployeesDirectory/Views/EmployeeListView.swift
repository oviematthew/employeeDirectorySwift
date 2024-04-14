//
//  EmployeesListView.swift
//  EmployeesDirectory
//
//  Created by Matthew Ovie Enamuotor on 13/04/2024.
//

import SwiftUI

struct EmployeeListView: View {
    @StateObject var viewModel: EmployeeListViewModel
    
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView("Fetching Employees...")
                    .progressViewStyle(CircularProgressViewStyle())
            } else {
                listContentView
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
            .navigationTitle(viewModel.navTitle)
            .refreshable {
                await viewModel.fetchEmployees()
            }
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search For Employee")
            .onChange(of: viewModel.searchText){
                viewModel.filterEmployees()
            }
            
        }
    }
}

#Preview {
    EmployeeListView(viewModel: EmployeeListViewModel(service: EmployeeService()))
}
