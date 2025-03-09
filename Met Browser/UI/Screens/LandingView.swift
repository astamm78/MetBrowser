//
//  ContentView.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import SwiftUI

struct LandingView: View {
    @EnvironmentObject var viewModel: LandingViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.middleGrey
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        header
                        
                        DepartmentDropdown()
                        
                        KeywordSearchBar()
                    }
                    .background(Color.accentColor)
                    
                    subheader
                    
                    ResultsList()
                }
                
                if viewModel.dataLoading {
                    LoadingView()
                }
            }
        }
    }
    
    var header: some View {
        HStack(alignment: .center) {
            Image("MetLogo")
                .resizable()
                .frame(width: 60, height: 60, alignment: .center)
            
            Text("The Met Browser")
                .foregroundStyle(.offset)
                .fontDesign(.serif)
                .font(.largeTitle)
                .accessibilityIdentifier(TestingIdentifiers.LandingView.headerText)
        }
    }
    
    var subheader: some View {
        Text(viewModel.resultsMode.displayText)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundStyle(.offset)
            .padding(.vertical, 12)
            .accessibilityIdentifier(TestingIdentifiers.LandingView.listHeader)
    }
}

#Preview {
    LandingView()
        .environmentObject(LandingViewModel.preview)
}
