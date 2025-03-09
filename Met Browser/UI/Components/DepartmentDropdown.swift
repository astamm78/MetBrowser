//
//  DepartmentDropdown.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/9/25.
//

import SwiftUI

struct DepartmentDropdown: View {
    @EnvironmentObject var viewModel: LandingViewModel
    
    var body: some View {
        Picker(
            "Departments",
            selection: $viewModel.selectedDepartmentID
        ) {
            Text(viewModel.deptFilterOn ? "Reset Department" : "Filter by Department")
                .tag(0)
                .accessibilityIdentifier(TestingIdentifiers.LandingView.firstOption)
            
            ForEach(viewModel.departments) { department in
                Text(department.displayName)
                    .tag(department.departmentId)
                    .accessibilityIdentifier(TestingIdentifiers.LandingView.dropdownOption)
            }
        }
        .accentColor(.white)
        .frame(maxWidth: .infinity)
        .accessibilityIdentifier(TestingIdentifiers.LandingView.departmentsDropdown)
        .onChange(of: viewModel.selectedDepartmentID) { oldValue, newValue in
            Task {
                await viewModel.search()
            }
        }
    }
}

#Preview {
    ZStack {
        Color.offset
            .edgesIgnoringSafeArea(.all)
        
        DepartmentDropdown()
            .environmentObject(LandingViewModel.preview)
    }
}
