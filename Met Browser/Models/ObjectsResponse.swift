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
}
