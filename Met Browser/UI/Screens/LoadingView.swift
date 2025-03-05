//
//  LoadingView.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/5/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.25)
                .edgesIgnoringSafeArea(.all)
            
            ProgressView()
                .progressViewStyle(
                    CircularProgressViewStyle(tint: .blue)
                )
                .scaleEffect(2.25, anchor: .center)
        }
    }
}

#Preview {
    LoadingView()
}
