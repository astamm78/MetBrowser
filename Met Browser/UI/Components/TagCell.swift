//
//  TagCell.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/6/25.
//

import SwiftUI

struct TagCell: View {
    var tag: Tag
    
    var body: some View {
        HStack {
            Text(tag.term)
                .font(.caption2)
                .foregroundStyle(.white)
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 2)
        .background(Color.offset)
        .cornerRadius(2)
    }
}

#Preview {
    TagCell(tag: Tag.preview)
}
