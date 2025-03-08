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
    
    var displayTitle: String {
        title.htmlCleaned()
    }
    
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
    
    var detailsArray: [DetailEntry] {
        var arr: [DetailEntry] = []
        
        if !culture.isEmpty {
            arr.append(DetailEntry(id: "Culture", value: culture))
        }
        
        if !period.isEmpty {
            arr.append(DetailEntry(id: "Period", value: period))
        }
        
        if !dynasty.isEmpty {
            arr.append(DetailEntry(id: "Dynasty", value: dynasty))
        }
        
        if !objectDate.isEmpty {
            arr.append(DetailEntry(id: "Date", value: objectDate))
        }
        
        if !medium.isEmpty {
            arr.append(DetailEntry(id: "Medium", value: medium))
        }
        
        if !dimensions.isEmpty {
            arr.append(DetailEntry(id: "Dimensions", value: dimensions))
        }
        
        return arr
    }
}

typealias MetObjectCollection = [MetObject]

extension MetObjectCollection: Previewable {
    typealias PreviewType = MetObjectCollection
}

struct DetailEntry: Identifiable {
    var id: String
    var value: String
}
