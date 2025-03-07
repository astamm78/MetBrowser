//
//  DepartmentsResponse_tests.swift
//  Met BrowserTests
//
//  Created by Andrew Stamm on 3/7/25.
//

import XCTest
@testable import Met_Browser

final class DepartmentsResponse_tests: XCTestCase {

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func test_decoding_missingDepartments() throws {
        let data = removeJSON_Key(key: "departments", from: DepartmentsResponse.testData())
        
        AssertThrowsKeyNotFound(
            "departments",
            decoding: DepartmentsResponse.self,
            from: data
        )
    }

}
