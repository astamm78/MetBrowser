//
//  Array+Extension_tests.swift
//  Met BrowserTests
//
//  Created by Andrew Stamm on 3/5/25.
//

import XCTest
@testable import Met_Browser

final class Array_Extension_tests: XCTestCase {

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func test_chunked() throws {
        let testArray = [1, 2, 3, 4, 5]
        XCTAssertEqual(testArray.chunked(2), [[1, 2], [3, 4], [5]])
    }

}
