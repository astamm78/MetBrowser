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
    
    func objectIDsForDisplay(max: Int, shuffled: Bool = false) -> [Int]? {
        guard let objectIDs else { return nil }
        
        let _objectIDs = shuffled ? objectIDs.shuffled() : objectIDs
        
        return Array(_objectIDs.prefix(max))
    }
}
