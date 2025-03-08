//
//  String+Extension_tests.swift
//  Met BrowserTests
//
//  Created by Andrew Stamm on 3/8/25.
//

import XCTest
@testable import Met_Browser

final class String_Extension_tests: XCTestCase {

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func test_htmlCleaned() throws {
        let string = "<h1>Headline</h1>"
        XCTAssertEqual(string.htmlCleaned(), "Headline")
    }

}
