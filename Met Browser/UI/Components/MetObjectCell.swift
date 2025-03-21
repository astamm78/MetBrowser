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
                HStack(alignment: .top, spacing: 12) {
                    MetObjectThumbnail(metObject: metObject)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        if !metObject.title.isEmpty {
                            Text(metObject.displayTitle)
                                .font(.title3)
                                .foregroundStyle(Color.accentColor)
                                .multilineTextAlignment(.leading)
                        }
                        
                        if let constituents = metObject.constituents,
                           !constituents.isEmpty {
                            Text(metObject.constituents?.first?.name ?? "")
                                .font(.subheadline)
                                .foregroundStyle(Color.offset)
                                .multilineTextAlignment(.leading)
                        }
                        
                        if let tags = metObject.tags, !tags.isEmpty {
                            HStack(spacing: 8) {
                                ForEach(tags.prefix(3)) { tag in
                                    TagCell(tag: tag)
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
