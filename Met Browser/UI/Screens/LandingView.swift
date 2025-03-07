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
                        
                        
                        Picker(
                            "Departments",
                            selection: $viewModel.selectedDepartmentID
                        ) {
                            Text("Search in Department").tag(0)
                            ForEach(viewModel.departments) { department in
                                Text(department.displayName)
                                    .tag(department.departmentId)
                            }
                        }
                        .accentColor(.white)
                        .frame(maxWidth: .infinity)
                        
                        VStack {
                            HStack {
                                TextField("Search by Term", text: $viewModel.searchTerm)
                                
                                Button {
                                    Task {
                                        await viewModel.search()
                                    }
                                } label: {
                                    Text("Search")
                                }
                            }
                            .padding()
                        }
                        .background(.white)
                    }
                    .background(Color.accentColor)
                    
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
