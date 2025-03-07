//
//  Constituent.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation

struct Constituent: Codable, Previewable {
    typealias PreviewType = Constituent
    
    var constituentID: Int
    var role: String
    var name: String
    var constituentWikidata_URL: String
}
