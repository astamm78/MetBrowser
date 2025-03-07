//
//  Tag.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/7/25.
//

import Foundation

struct Tag: Codable, Identifiable, Previewable {
    typealias PreviewType = Tag
    
    var id: String { term }
    
    var term: String
}
