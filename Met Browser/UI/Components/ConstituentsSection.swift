//
//  ConstituentsSection.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/7/25.
//

import SwiftUI

struct ConstituentsSection: View {
    @Environment(\.openURL) var openURL
    
    var constituents: [Constituent]
    
    var body: some View {
        VStack {
            ForEach(constituents) { constituent in
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(constituent.name)
                            .foregroundStyle(.white)
                            .font(.headline)
                        
                        Text(constituent.role)
                            .foregroundStyle(.white)
                            .font(.subheadline)
                    }
                    
                    Spacer()
                    
                    if let url = constituent.wikidataURL {
                        MetButton(action: {
                            openURL(url)
                        }, label: "View Artist Wiki")
                    }
                }
                .padding()
            }
        }
        .background(Color.offset)
        .cornerRadius(8)
        .padding()
    }
}

#Preview {
    ConstituentsSection(
        constituents: [Constituent.preview]
    )
}
