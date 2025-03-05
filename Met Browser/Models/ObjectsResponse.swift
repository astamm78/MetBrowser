//
//  ObjectsResponse.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation

struct ObjectsResponse: Codable, Previewable {
    typealias PreviewType = ObjectsResponse
    
    var total: Int
    var objectIDs: [Int]?
    
    func paginatedObjectIDs(pageSize: Int, shuffled: Bool = false) -> PaginatedObjectIDs? {
        guard let objectIDs else { return nil }
        
        let chunks = (shuffled ? objectIDs.shuffled() : objectIDs).chunked(pageSize)
        let pages = chunks.enumerated().map { (index, chunk) in
            PaginatedObjectIDs.Page(page: index + 1, objectIDs: chunk)
        }
        
        return PaginatedObjectIDs(
            totalPages: chunks.count,
            totalObjects: objectIDs.count,
            pages: pages
        )
    }
}
