//
//  Constituent_tests.swift
//  Met BrowserTests
//
//  Created by Andrew Stamm on 3/7/25.
//

import XCTest
@testable import Met_Browser

final class Constituent_tests: XCTestCase {

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func test_decoding_missingID() throws {
        let data = removeKey("constituentID", from: Constituent.testData())
        
        AssertThrowsKeyNotFound(
            "constituentID",
            decoding: Constituent.self,
            from: data
        )
    }
    
    func test_decoding_missingRole() throws {
        let data = removeKey("role", from: Constituent.testData())
        
        AssertThrowsKeyNotFound(
            "role",
            decoding: Constituent.self,
            from: data
        )
    }
    
    func test_decoding_missingName() throws {
        let data = removeKey("name", from: Constituent.testData())
        
        AssertThrowsKeyNotFound(
            "name",
            decoding: Constituent.self,
            from: data
        )
    }
    
    func test_decoding_missingConstituentWikidata_URL() throws {
        let data = removeKey("constituentWikidata_URL", from: Constituent.testData())
        
        AssertThrowsKeyNotFound(
            "constituentWikidata_URL",
            decoding: Constituent.self,
            from: data
        )
    }

}
