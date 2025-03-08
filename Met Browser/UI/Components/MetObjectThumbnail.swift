//
//  MetObjectThumbnail.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct MetObjectThumbnail: View {
    var metObject: MetObject
    
    var body: some View {
        WebImage(url: metObject.primaryImageSmallURL) { image in
            image
        } placeholder: {
            Image(systemName: "photo.artframe")
                .imageScale(.large)
                .foregroundStyle(Color.white)
        }
        .resizable()
        .scaledToFill()
        .frame(width: 60, height: 60, alignment: .center)
        .clipped()
        .background(Color.offset)
        .cornerRadius(30)
    }
}

#Preview {
    MetObjectThumbnail(
        metObject: MetObject.preview
    )
}
