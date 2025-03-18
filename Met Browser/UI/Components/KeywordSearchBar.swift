//
//  KeywordSearchBar.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/9/25.
//

import SwiftUI
import AsyncButton

struct KeywordSearchBar: View {
    @EnvironmentObject var viewModel: LandingViewModel
    
    @FocusState var searchFieldIsFocused: Bool
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search by Term", text: $viewModel.searchTerm)
                    .focused($searchFieldIsFocused)
                    .accessibilityIdentifier(TestingIdentifiers.LandingView.searchBar)
                    .submitLabel(.search)
                    .onSubmit {
                        performSearch()
                    }
                    .overlay(alignment: .trailing) {
                        if !viewModel.searchTerm.isEmpty {
                            AsyncButton {
                                await viewModel.clearTermAndSearch()
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundStyle(Color.offset)
                            }
                            .accessibilityIdentifier(TestingIdentifiers.LandingView.clearSearchButton)
                        }
                    }
                
                AsyncButton {
                    searchFieldIsFocused = false
                    
                    await viewModel.search()
                } label: {
                    Text("Search")
                }
                .accessibilityIdentifier(TestingIdentifiers.LandingView.searchButton)
            }
            .padding()
        }
        .background(.white)
    }
    
    private func performSearch() {
        searchFieldIsFocused = false
        
        Task {
            await viewModel.search()
        }
    }
}

#Preview {
    KeywordSearchBar()
        .environmentObject(LandingViewModel.preview)
}
