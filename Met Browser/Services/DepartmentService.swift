//
//  DepartmentService.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation

struct DepartmentService: NetworkingService {
    var networkingHandler: any NetworkingHandlerProtocol
    
    func getDepartments() async throws -> DepartmentsResponse {
        let endpoint = MetEndpoint.departments
        let obj: DepartmentsResponse = try await networkingHandler.request(endpoint: endpoint)
        return obj
    }
}
