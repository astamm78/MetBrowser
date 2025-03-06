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
            Color.clear
                .edgesIgnoringSafeArea(.all)
            
            Circle()
                .frame(width: 80, height: 80, alignment: .center)
                .foregroundStyle(.accent)
                .shadow(color: .black, radius: 40, x: 0, y: 0)
            
            ProgressView()
                .progressViewStyle(
                    CircularProgressViewStyle(tint: .white)
                )
                .scaleEffect(2.25, anchor: .center)
        }
    }
}

#Preview {
    LoadingView()
}
