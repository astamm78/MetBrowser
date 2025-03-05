//
//  PaginatedObjectIDs.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/5/25.
//

import Foundation

struct PaginatedObjectIDs {
    struct Page {
        var page: Int
        var objectIDs: [Int]
    }
    
    var totalPages: Int
    var totalObjects: Int
    var pages: [Page]
    
    func objectIDs(for page: Int) -> [Int]? {
        return pages.first(where: { $0.page == page} )?.objectIDs
    }
}
