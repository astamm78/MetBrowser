//
//  SearchService.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation

struct SearchService {
    static func search(term: String) async throws -> ObjectsResponse {
        let endpoint = MetEndpoint.search(term: term)
        let data = try await NetworkingHandler.shared.request(endpoint: endpoint)
        let response: ObjectsResponse = try JSONDataHandler.shared.decodeData(data)
        return response
    }
}
