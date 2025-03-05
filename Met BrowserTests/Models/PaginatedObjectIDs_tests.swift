//
//  PaginatedObjectIDs_tests.swift
//  Met BrowserTests
//
//  Created by Andrew Stamm on 3/5/25.
//

import XCTest
@testable import Met_Browser

final class PaginatedObjectIDs_tests: XCTestCase {
    
    var paginatedObjectIDs: PaginatedObjectIDs!

    override func setUpWithError() throws {
        paginatedObjectIDs = PaginatedObjectIDs(
            totalPages: 2,
            totalObjects: 4,
            pages: [
                PaginatedObjectIDs.Page(page: 1, objectIDs: [1, 2]),
                PaginatedObjectIDs.Page(page: 2, objectIDs: [3, 4])
            ]
        )
    }

    override func tearDownWithError() throws {
        paginatedObjectIDs = nil
    }

    func test_objectIDsFor() throws {
        XCTAssertEqual(paginatedObjectIDs.objectIDs(for: 1), [1, 2])
        XCTAssertEqual(paginatedObjectIDs.objectIDs(for: 2), [3, 4])
        XCTAssertEqual(paginatedObjectIDs.objectIDs(for: 3), nil)
    }

}
