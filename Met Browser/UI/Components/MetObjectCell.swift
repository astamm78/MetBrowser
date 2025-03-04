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
                    
                    VStack(alignment: .leading) {
                        Text(metObject.title)
                            .font(.title3)
                        
                        Text(metObject.artistDisplayName)
                            .font(.subheadline)
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
