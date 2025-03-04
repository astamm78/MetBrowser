//
//  MetObject.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation

struct MetObject: Codable, Previewable {
    typealias PreviewType = MetObject
    
    var objectID: Int
    var isHighlight: Bool
    var accessionYear: String
    var isPublicDomain: Bool
    var primaryImage: String
    var primaryImageSmall: String
    var additionalImages: [String]
    var constituents: [Constituent]?
    var department: String
    var title: String
    var culture: String
    var period: String
    var dynasty: String
    var reign: String
    var artistDisplayName: String
    var artistDisplayBio: String
    var objectDate: String
    var medium: String
    var dimensions: String
    var creditLine: String
    var objectWikidata_URL: String
    
    var primaryImageURL: URL? {
        guard !primaryImage.isEmpty else { return nil }
        
        return URL(string: primaryImage)
    }
    
    var wikidataURL: URL? {
        guard !objectWikidata_URL.isEmpty else { return nil }
        
        return URL(string: objectWikidata_URL)
    }
}
