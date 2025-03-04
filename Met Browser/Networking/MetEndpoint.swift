//
//  MetEndpoint.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation
import Alamofire

enum MetEndpoint {
    case objects(deptIDs: String?, metadataDate: String?)
    case object(objectID: Int)
    case departments
    case search(term: String)
    
    var baseURL: String {
        "https://collectionapi.metmuseum.org/public/collection/v1/"
    }
    
    var path: String {
        switch self {
        case .objects:
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
        var baseParams: Parameters?
        
        switch self {
        case .objects(let deptIDs, let metadataDate):
            if let metadataDate {
                baseParams?["metadataDate"] = metadataDate
            }
            
            if let deptIDs {
                baseParams?["departmentIds"] = deptIDs
            }
        case .search(let term):
            baseParams?["q"] = term
        default:
            return nil
        }
        
        return baseParams
    }
    
    var url: String {
        "\(baseURL)\(path)"
    }
}
