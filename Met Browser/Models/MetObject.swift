//
//  MetObject.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation

struct MetObject: Codable, Previewable, Identifiable {
    typealias PreviewType = MetObject
    
    var id: Int { objectID }
    
    var objectID: Int
    var isHighlight: Bool
    var accessionYear: String
    var primaryImage: String
    var primaryImageSmall: String
    var additionalImages: [String]
    var constituents: [Constituent]?
    var department: String
    var title: String
    var culture: String
    var period: String
    var dynasty: String
    var objectDate: String
    var medium: String
    var dimensions: String
    var objectWikidata_URL: String
    var tags: [Tag]?
    
    var primaryImageURL: URL? {
        guard !primaryImage.isEmpty else { return nil }
        
        return URL(string: primaryImage)
    }
    
    var primaryImageSmallURL: URL? {
        guard !primaryImageSmall.isEmpty else { return nil }
        
        return URL(string: primaryImageSmall)
    }
    
    var additionalImagesUrls: [URL?]? {
        guard !additionalImages.isEmpty else { return nil}
        
        return additionalImages.map({ URL(string: $0) })
    }
    
    var displayURL: URL? {
        primaryImageURL ?? primaryImageSmallURL ?? (additionalImagesUrls?.first ?? nil)
    }
    
    var wikidataURL: URL? {
        guard !objectWikidata_URL.isEmpty else { return nil }
        
        return URL(string: objectWikidata_URL)
    }
}

typealias MetObjectCollection = [MetObject]

extension MetObjectCollection: Previewable {
    typealias PreviewType = MetObjectCollection
}
