//
//  ImageDetail.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/6/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageDetail: View {
    var metObject: MetObject
    
    var body: some View {
        WebImage(url: metObject.displayURL) { image in
            ZStack {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .overlay(alignment: .bottomTrailing) {
                if let url = metObject.displayURL {
                    ShareLink(
                        item: url,
                        preview: SharePreview(
                            metObject.title,
                            image: image
                        )
                    ) {
                        ZStack {
                            Circle()
                                .frame(width: 30, height: 30, alignment: .center)
                                .foregroundStyle(.white)
                                .shadow(color: .offset, radius: 5, x: -2, y: 2)
                            
                            Image(systemName: "square.and.arrow.up")
                                .imageScale(.small)
                                .offset(x: 0, y: -1.75)
                        }
                    }
                    .padding(20)
                }
            }
        } placeholder: {
            HStack {
                Image(systemName: "photo.badge.exclamationmark.fill")
                    .foregroundStyle(Color.white)
                    .scaleEffect(2.0)
            }
            .frame(width: 200, height: 160, alignment: .center)
            .background(Color.accentColor)
            .cornerRadius(12)
        }
        .padding(.top, 20)
    }
}

#Preview("With Image URL") {
    ImageDetail(
        metObject: MetObject.preview
    )
    .environmentObject(LandingViewModel.preview)
}

#Preview("Without Image URL") {
    ImageDetail(
        metObject: MetObject.customPreview(from: "MetObject_no_image")
    )
}
