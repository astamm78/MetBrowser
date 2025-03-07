//
//  MetObjectDetail.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import SwiftUI

struct MetObjectDetail: View {
    @Environment(\.openURL) var openURL
    
    var metObject: MetObject
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 12) {
                    ImageDetail(metObject: metObject)
                        .frame(maxWidth: .infinity)
                    
                    if !metObject.title.isEmpty {
                        Text(metObject.title)
                            .font(.title)
                            .fontDesign(.serif)
                            .foregroundStyle(.offset)
                            .multilineTextAlignment(.center)
                    }
                    
                    VStack(spacing: 8) {
                        if !metObject.artistDisplayName.isEmpty {
                            Text(metObject.artistDisplayName)
                        }
                        
                        if !metObject.department.isEmpty {
                            Text(metObject.department)
                                .font(.headline)
                                .foregroundStyle(.offset)
                                .multilineTextAlignment(.center)
                        }
                    }
                    
                    if let wikidataURL = metObject.wikidataURL {
                        MetButton(
                            action: {
                                openURL(wikidataURL)
                            },
                            label: "View Wiki"
                        )
                        .padding(.top, 18)
                    }
                }
            }
            .background(Color.middleGrey)
        }
        .navigationTitle(metObject.title)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(.white, for: .navigationBar)
    }
}

#Preview("With Image") {
    MetObjectDetail(
        metObject: MetObject.preview
    )
}

#Preview("Without Image") {
    MetObjectDetail(
        metObject: MetObject.customPreview(from: "MetObject_no_image")
    )
}
