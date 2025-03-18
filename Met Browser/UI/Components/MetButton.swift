//
//  MetButton.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/6/25.
//

import SwiftUI
import AsyncButton

struct MetButton: View {
    var action: (() async throws -> Void)?
    var label: String
    
    var body: some View {
        AsyncButton {
            try await action?()
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
