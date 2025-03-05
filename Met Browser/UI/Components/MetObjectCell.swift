//
//  MetObjectCell.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import SwiftUI

struct MetObjectCell: View {
    var metObject: MetObject
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack(alignment: .center, spacing: 12) {
                    MetObjectThumbnail(metObject: metObject)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        if !metObject.title.isEmpty {
                            Text(metObject.title)
                                .font(.title3)
                                .multilineTextAlignment(.leading)
                        }
                        
                        if !metObject.artistDisplayName.isEmpty {
                            Text(metObject.artistDisplayName)
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                        }
                        
                        if !metObject.tags.isEmpty {
                            HStack(spacing: 8) {
                                ForEach(metObject.tags) { tag in
                                    Text(tag.term)
                                        .font(.caption2)
                                        .foregroundStyle(.tint)
                                }
                            }
                        }
                    }
                    
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity)
            .padding(12)
        }
    }
}

#Preview {
    MetObjectCell(
        metObject: MetObject.preview
    )
}
