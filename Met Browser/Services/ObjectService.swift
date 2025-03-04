//
//  ObjectService.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation

struct ObjectService {
    static func getOilPaintingHighlights() async throws -> ObjectsResponse {
        let endpoint = MetEndpoint.oilPaintingHighlights
        let data = try await NetworkingHandler.shared.request(endpoint: endpoint)
        let response: ObjectsResponse = try JSONDataHandler.shared.decodeData(data)
        return response
    }
    
    static func getObjectIDs(deptIDs: [Int]?, metadataDate: String?) async throws -> ObjectsResponse {
        let formattedDeptIDs: String? = deptIDs?.map({ String($0) }).joined(separator: "|")
        let endpoint = MetEndpoint.objects(deptIDs: formattedDeptIDs, metadataDate: metadataDate)
        let data = try await NetworkingHandler.shared.request(endpoint: endpoint)
        let response: ObjectsResponse = try JSONDataHandler.shared.decodeData(data)
        return response
    }
    
    static func getObjectDetail(objectID: Int) async throws -> MetObject {
        let endpoint = MetEndpoint.object(objectID: objectID)
        let data = try await NetworkingHandler.shared.request(endpoint: endpoint)
        let response: MetObject = try JSONDataHandler.shared.decodeData(data)
        return response
    }
}
