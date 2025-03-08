//
//  ContentView.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import SwiftUI

struct LandingView: View {
    @EnvironmentObject var viewModel: LandingViewModel
    
    @FocusState var searchFieldIsFocused: Bool
    
    
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
                        
                        VStack {
                            HStack {
                                TextField("Search by Term", text: $viewModel.searchTerm)
                                    .focused($searchFieldIsFocused)
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
                                    searchFieldIsFocused = false
                                    
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
                        .accessibilityIdentifier(TestingIdentifiers.LandingView.listHeader)
                    
                    ScrollView {
                        ForEach(viewModel.metObjects) { metObject in
                            NavigationLink {
                                MetObjectDetail(metObject: metObject)
                            } label: {
                                MetObjectCell(metObject: metObject)
                            }
                            .accessibilityIdentifier(TestingIdentifiers.LandingView.objectCell)
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
