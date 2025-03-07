//
//  SearchService.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation

struct SearchService: NetworkingService {
    var networkingHandler: NetworkingHandlerProtocol
    
    func search(term: String, deptID: Int?) async throws -> ObjectsResponse {
        let endpoint = MetEndpoint.search(term: term, deptId: deptID)
        let obj: ObjectsResponse = try await networkingHandler.request(endpoint: endpoint)
        return obj
    }
}
