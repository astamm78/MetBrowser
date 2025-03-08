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
            ZStack {
                Color.middleGrey
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        Text("The Met Browser")
                            .foregroundStyle(.offset)
                            .fontDesign(.serif)
                            .font(.largeTitle)
                            .accessibilityIdentifier(TestingIdentifiers.LandingView.headerText)
                        
                        
                        Picker(
                            "Departments",
                            selection: $viewModel.selectedDepartmentID
                        ) {
                            Text(viewModel.deptFilterOn ? "Filter by Department" : "Reset Department")
                                .tag(0)
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
                        
                        VStack {
                            HStack {
                                TextField("Search by Term", text: $viewModel.searchTerm)
                                    .accessibilityIdentifier(TestingIdentifiers.LandingView.searchBar)
                                    .overlay(alignment: .trailing) {
                                        if !viewModel.searchTerm.isEmpty {
                                            Button {
                                                Task {
                                                    await viewModel.clearTermAndSearch()
                                                }
                                            } label: {
                                                Image(systemName: "xmark.circle.fill")
                                                    .foregroundStyle(Color.offset)
                                            }
                                            .accessibilityIdentifier(TestingIdentifiers.LandingView.clearSearchButton)
                                        }
                                    }
                                
                                Button {
                                    Task {
                                        await viewModel.search()
                                    }
                                } label: {
                                    Text("Search")
                                }
                                .accessibilityIdentifier(TestingIdentifiers.LandingView.searchButton)
                            }
                            .padding()
                        }
                        .background(.white)
                    }
                    .background(Color.accentColor)
                    
                    Text(viewModel.resultsMode.displayText)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.offset)
                        .padding(.vertical, 12)
                    
                    ScrollView {
                        ForEach(viewModel.metObjects) { metObject in
                            NavigationLink {
                                MetObjectDetail(metObject: metObject)
                            } label: {
                                MetObjectCell(metObject: metObject)
                            }
                        }
                        
                        if viewModel.showViewMoreButton {
                            MetButton(
                                action: {
                                    Task {
                                        await viewModel.loadNextPage()
                                    }
                                },
                                label: "View More"
                            )
                        }
                    }
                }
                
                if viewModel.dataLoading {
                    LoadingView()
                }
            }
        }
    }
}

#Preview {
    LandingView()
        .environmentObject(LandingViewModel.preview)
}
