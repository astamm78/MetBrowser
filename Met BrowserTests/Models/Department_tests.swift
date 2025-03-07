//
//  Department_tests.swift
//  Met BrowserTests
//
//  Created by Andrew Stamm on 3/7/25.
//

import XCTest
@testable import Met_Browser

final class Department_tests: XCTestCase {
    
    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func test_decoding_missingDepartmentID() throws {
        let data = removeKey("departmentId", from: Department.testData())
        
        AssertThrowsKeyNotFound(
            "departmentId",
            decoding: Department.self,
            from: data
        )
    }
    
    func test_decoding_missingDisplayName() throws {
        let data = removeKey("displayName", from: Department.testData())
        
        AssertThrowsKeyNotFound(
            "displayName",
            decoding: Department.self,
            from: data
        )
    }

}
