//
//  MetButton.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/6/25.
//

import SwiftUI

struct MetButton: View {
    var action: (() -> Void)?
    var label: String
    
    var body: some View {
        Button {
            action?()
        } label: {
            HStack {
                Text(label)
                    .font(.callout)
                    .foregroundStyle(.white)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color.accentColor)
            .cornerRadius(8)
        }

    }
}

#Preview {
    VStack {
        MetButton(label: "Submit")
    }
    .padding()
}
