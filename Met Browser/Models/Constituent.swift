//
//  Constituent.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation

struct Constituent: Codable, Identifiable, Previewable {
    typealias PreviewType = Constituent
    
    var id: Int { constituentID }
    
    var constituentID: Int
    var role: String
    var name: String
    var constituentWikidata_URL: String
    
    var wikidataURL: URL? {
        guard !constituentWikidata_URL.isEmpty else { return nil }
        
        return URL(string: constituentWikidata_URL)
    }
}
