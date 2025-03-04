//
//  ContentView.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import SwiftUI

struct LandingView: View {
    @EnvironmentObject var viewModel: LandingViewModel
    
    @State private var selectedDepartmentID: Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                
                Text("Hello, world!")
                
                Picker("Departments", selection: $viewModel.selectedDepartmentID) {
                    Text("Select a Department").tag(0)
                    ForEach(viewModel.departments) { department in
                        Text(department.displayName).tag(department.departmentId)
                    }
                }
                
                TextField("Search Term", text: $viewModel.searchTerm)
                
                Button {
                    Task {
                        await viewModel.search()
                    }
                } label: {
                    Text("Search")
                }

                
                ScrollView {
                    ForEach(viewModel.metObjects) { metObject in
                        NavigationLink {
                            MetObjectDetail(metObject: metObject)
                        } label: {
                            MetObjectCell(metObject: metObject)
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle(Text("The MET Browser"))
    }
}

#Preview {
    LandingView()
        .environmentObject(
            LandingViewModel(
                departments: DepartmentsResponse.preview.departments
            )
        )
}
