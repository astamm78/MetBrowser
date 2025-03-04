//
//  MetObjectDetail.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct MetObjectDetail: View {
    var metObject: MetObject
    
    var body: some View {
        VStack {
            WebImage(url: metObject.primaryImageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            if !metObject.title.isEmpty {
                Text(metObject.title)
                    .font(.title)
            }
        }
    }
}

#Preview {
    MetObjectDetail(
        metObject: MetObject.preview
    )
}
