//
//  DepartmentService.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation

struct DepartmentService {
    static func getDepartments() async throws -> DepartmentsResponse {
        let endpoint = MetEndpoint.departments
        let data = try await NetworkingHandler.shared.request(endpoint: endpoint)
        let response: DepartmentsResponse = try JSONDataHandler.shared.decodeData(data)
        return response
    }
}
