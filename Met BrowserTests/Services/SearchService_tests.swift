//
//  SearchService_tests.swift
//  Met BrowserTests
//
//  Created by Andrew Stamm on 3/7/25.
//

import XCTest
@testable import Met_Browser

final class SearchService_tests: XCTestCase {
    
    var searchService: SearchService!

    override func setUpWithError() throws {
        searchService = SearchService(networkingHandler: MockNetworkingHandler())
    }

    override func tearDownWithError() throws {
        searchService = nil
    }

    func test_search_returnsObjectsResponse() async throws {
        let response = try await searchService.search(term: "Search Term", deptID: 99)
        XCTAssertTrue(type(of: response) == ObjectsResponse.self, "Expected response to be of type ObjectsResponse")
    }

}
