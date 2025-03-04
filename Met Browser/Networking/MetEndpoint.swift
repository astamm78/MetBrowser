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
    case search(title: String?, artist: String?, deptID: Int?)
    
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
        var baseParams: Parameters?
        
        switch self {
        case .objects(let deptIDs, let metadataDate):
            if let metadataDate {
                baseParams?["metadataDate"] = metadataDate
            }
            
            if let deptIDs {
                baseParams?["departmentIds"] = deptIDs
            }
        case .search(let title, let artist, let deptID):
            if let title {
                baseParams?["title"] = title
            }
            
            if let artist {
                baseParams?["artistOrCulture"] = artist
            }
            
            if let deptID {
                baseParams?["departmentId"] = deptID
            }
        default:
            return nil
        }
        
        return baseParams
    }
    
    var url: String {
        "\(baseURL)\(path)"
    }
}
