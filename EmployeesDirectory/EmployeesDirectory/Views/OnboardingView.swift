//
//  OnboardingView.swift
//  EmployeesDirectory
//
//  Created by Matthew Ovie Enamuotor on 13/04/2024.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var onboardingRequired: Bool
    
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome to Employees")
                .font(.system(size: 30,weight: .heavy))
            HighightView(sfSymbol: "person.3", color: .blue, title: "Detailed Employee Data", description: "View detailed data which includes  detailed description about all employees at fanshawe college.")
            Spacer()
            Button {
                onboardingRequired = false
            } label: {
                Text("Done")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding([.horizontal], 40)
            
        }
    }
}

#Preview {
    OnboardingView(onboardingRequired: .constant(true))
}

struct HighightView: View {
    let sfSymbol: String
    let color: Color
    let title: String
    let description: String
    
    var body: some View {
        HStack {
            Image(systemName: "\(sfSymbol)")
                .foregroundColor(color)
                .font(.system(size: 30))
                .padding(.horizontal)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(description)
            }
        }
        .padding()
    }
}
