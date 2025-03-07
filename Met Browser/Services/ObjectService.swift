//
//  ObjectService.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation

struct ObjectService: NetworkingService {
    var networkingHandler: any NetworkingHandlerProtocol
    
    func getOilPaintingHighlights() async throws -> ObjectsResponse {
        let endpoint = MetEndpoint.oilPaintingHighlights
        let obj: ObjectsResponse = try await networkingHandler.request(endpoint: endpoint)
        return obj
    }
    
    func getObjectIDs(deptIDs: [Int]?, metadataDate: String?) async throws -> ObjectsResponse {
        let formattedDeptIDs: String? = deptIDs?.map({ String($0) }).joined(separator: "|")
        let endpoint = MetEndpoint.objects(deptIDs: formattedDeptIDs, metadataDate: metadataDate)
        let obj: ObjectsResponse = try await networkingHandler.request(endpoint: endpoint)
        return obj
    }
    
    func getObjectDetail(objectID: Int) async throws -> MetObject {
        let endpoint = MetEndpoint.object(objectID: objectID)
        let obj: MetObject = try await networkingHandler.request(endpoint: endpoint)
        return obj
    }
}
