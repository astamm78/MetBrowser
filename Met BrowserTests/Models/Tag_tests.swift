//
//  Tag_tests.swift
//  Met BrowserTests
//
//  Created by Andrew Stamm on 3/7/25.
//

import XCTest
@testable import Met_Browser

final class Tag_tests: XCTestCase {

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func test_decoding_missingTerm() throws {
        let data = removeKey("term", from: Tag.testData())

        AssertThrowsKeyNotFound(
            "term",
            decoding: Tag.self,
            from: data
        )
    }

}
