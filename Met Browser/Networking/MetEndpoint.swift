//
//  MetEndpoint.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation
import Alamofire

enum MetEndpoint {
    case objects(deptID: Int?, metadataDate: String?)
    case object(objectID: Int)
    case departments
    case search(title: String?, artist: String?)
    
    var baseURL: String {
        "https://collectionapi.metmuseum.org/public/collection/v1/"
    }
    
    var path: String {
        switch self {
        case .objects(let deptID, let metadataDate):
            "objects"
        case .object(let objectID):
            "objects/\(objectID)"
        case .departments:
            "departments"
        case .search:
            "search"
        }
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var params: Parameters? {
        return [:]
    }
    
    var url: String {
        "\(baseURL)\(path)"
    }
}
