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

    func test_objectIDsForDisplay() throws {
        let ids = objectsResponse.objectIDsForDisplay(max: 5, shuffled: true)
        
        // Should return an array of the correct size
        XCTAssertTrue(ids?.count == 5)
        
        // Should return an array in a different order than the first N of the original array
        XCTAssertTrue(ids != Array(objectsResponse.objectIDs?.prefix(5) ?? []))
    }

}
