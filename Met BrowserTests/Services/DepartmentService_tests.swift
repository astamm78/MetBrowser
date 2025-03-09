//
//  DepartmentService_tests.swift
//  Met BrowserTests
//
//  Created by Andrew Stamm on 3/7/25.
//

import XCTest
@testable import Met_Browser

final class DepartmentService_tests: XCTestCase {
    
    var departmentService: DepartmentService!

    override func setUpWithError() throws {
        departmentService = DepartmentService(networkingHandler: MockNetworkingHandler())
    }

    override func tearDownWithError() throws {
        departmentService = nil
    }

    func test_returnsDepartmentsResponse() async throws {
        Task {
            let response = try await departmentService.getDepartments()
            XCTAssertTrue(type(of: response) == DepartmentsResponse.self, "Expected response to be of type DepartmentsResponse")            
        }
    }

}
