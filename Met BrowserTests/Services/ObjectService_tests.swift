//
//  ObjectService_tests.swift
//  Met BrowserTests
//
//  Created by Andrew Stamm on 3/7/25.
//

import XCTest
@testable import Met_Browser

final class ObjectService_tests: XCTestCase {
    
    var objectService: ObjectService!

    override func setUpWithError() throws {
        objectService = ObjectService(networkingHandler: MockNetworkingHandler())
    }

    override func tearDownWithError() throws {
        objectService = nil
    }
    
    func test_getObjectDetail_returnsMetObject() async throws {
        Task {
            let response = try await objectService.getObjectDetail(objectID: 99)
            XCTAssertTrue(type(of: response) == MetObject.self, "Expected response to be of type MetObject")
        }
    }

    func test_getOilPaintingHighlights_returnsObjectsResponse() async throws {
        Task {
            let response = try await objectService.getOilPaintingHighlights()
            XCTAssertTrue(type(of: response) == ObjectsResponse.self, "Expected response to be of type ObjectsResponse")
        }
    }
    
    func test_getObjectIDs_returnsObjectsResponse() async throws {
        Task {
            let response = try await objectService.getObjectIDs(deptIDs: [99], metadataDate: nil)
            XCTAssertTrue(type(of: response) == ObjectsResponse.self, "Expected response to be of type ObjectsResponse")            
        }
    }

}
