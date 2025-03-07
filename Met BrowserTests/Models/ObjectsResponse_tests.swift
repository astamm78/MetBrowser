//
//  ObjectsResponse_tests.swift
//  Met BrowserTests
//
//  Created by Andrew Stamm on 3/5/25.
//

import XCTest
@testable import Met_Browser

final class ObjectsResponse_tests: XCTestCase {

    var objectsResponse: ObjectsResponse!
    
    override func setUpWithError() throws {
        objectsResponse = ObjectsResponse.preview
    }

    override func tearDownWithError() throws {
        objectsResponse = nil
    }

    func test_paginatedObjectIDs() throws {
        let paginatedObjectIDs = objectsResponse.paginatedObjectIDs(pageSize: 3)
        
        XCTAssertTrue(paginatedObjectIDs?.totalPages == 4)
        XCTAssertTrue(paginatedObjectIDs?.totalObjects == 10)
        XCTAssertTrue(paginatedObjectIDs?.objectIDs(for: 1)?.count ?? 0 == 3)
        XCTAssertTrue(paginatedObjectIDs?.objectIDs(for: 2)?.count ?? 0 == 3)
        XCTAssertTrue(paginatedObjectIDs?.objectIDs(for: 3)?.count ?? 0 == 3)
        XCTAssertTrue(paginatedObjectIDs?.objectIDs(for: 4)?.count ?? 0 == 1)
    }
    
    func test_decoding_missingTotal() throws {
        let data = removeJSON_Key(key: "total", from: ObjectsResponse.testData())

        AssertThrowsKeyNotFound(
            "total",
            decoding: ObjectsResponse.self,
            from: data
        )
    }

    func test_decoding_allowsMissingTags() throws {
        let data = removeJSON_Key(key: "objectIDs", from: ObjectsResponse.testData())
        let objectsResponse = ObjectsResponse.loadPreview(from: data)
        XCTAssertNotNil(objectsResponse)
    }

}
