//
//  ResultsList.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/9/25.
//

import SwiftUI

struct ResultsList: View {
    @EnvironmentObject var viewModel: LandingViewModel
    
    var body: some View {
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
}

#Preview {
    ResultsList()
        .environmentObject(LandingViewModel.preview)
}
