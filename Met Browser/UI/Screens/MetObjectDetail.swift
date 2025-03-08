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
                        Text(metObject.displayTitle)
                            .font(.title)
                            .fontDesign(.serif)
                            .foregroundStyle(.offset)
                            .multilineTextAlignment(.center)
                    }
                    
                    VStack(spacing: 8) {
                        if !metObject.department.isEmpty {
                            Text(metObject.department)
                                .font(.headline)
                                .foregroundStyle(.offset)
                                .multilineTextAlignment(.center)
                        }
                    }
                    
                    if let tags = metObject.tags, !tags.isEmpty {
                        HStack(spacing: 8) {
                            ForEach(tags.prefix(3)) { tag in
                                TagCell(tag: tag)
                            }
                        }
                    }
                    
                    if let wikidataURL = metObject.wikidataURL {
                        MetButton(
                            action: {
                                openURL(wikidataURL)
                            },
                            label: "View Wiki for \"\(metObject.title)\""
                        )
                        .padding(.top, 18)
                        .accessibilityIdentifier(TestingIdentifiers.MetObjectDetail.artworkWikiButton)
                    }
                    
                    if !metObject.detailsArray.isEmpty {
                        VStack {
                            ForEach(metObject.detailsArray) { detail in
                                HStack {
                                    Text(detail.id)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.leading)
                                    
                                    Spacer(minLength: 20)
                                    
                                    Text(detail.value)
                                        .font(.subheadline)
                                        .multilineTextAlignment(.trailing)
                                }
                                
                                Rectangle()
                                    .frame(height: 0.25)
                            }
                        }
                        .padding()
                    }
                    
                    if let constituents = metObject.constituents {
                        ConstituentsSection(constituents: constituents)
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
