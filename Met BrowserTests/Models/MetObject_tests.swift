//
//  MetObject_tests.swift
//  Met BrowserTests
//
//  Created by Andrew Stamm on 3/7/25.
//

import XCTest
@testable import Met_Browser

final class MetObject_tests: XCTestCase {

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func test_decoding_missingObjectID() throws {
        let data = removeJSON_Key(key: "objectID", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "objectID",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingIsHighlight() throws {
        let data = removeJSON_Key(key: "isHighlight", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "isHighlight",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingAccessionYear() throws {
        let data = removeJSON_Key(key: "accessionYear", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "accessionYear",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingPrimaryImage() throws {
        let data = removeJSON_Key(key: "primaryImage", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "primaryImage",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingPrimaryImageSmall() throws {
        let data = removeJSON_Key(key: "primaryImageSmall", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "primaryImageSmall",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingAdditionalImages() throws {
        let data = removeJSON_Key(key: "additionalImages", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "additionalImages",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingDepartment() throws {
        let data = removeJSON_Key(key: "department", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "department",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingTitle() throws {
        let data = removeJSON_Key(key: "title", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "title",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingCulture() throws {
        let data = removeJSON_Key(key: "culture", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "culture",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingPeriod() throws {
        let data = removeJSON_Key(key: "period", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "period",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingDynasty() throws {
        let data = removeJSON_Key(key: "dynasty", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "dynasty",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingObjectDate() throws {
        let data = removeJSON_Key(key: "objectDate", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "objectDate",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingMedium() throws {
        let data = removeJSON_Key(key: "medium", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "medium",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingDimensions() throws {
        let data = removeJSON_Key(key: "dimensions", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "dimensions",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingObjectWikidataURL() throws {
        let data = removeJSON_Key(key: "objectWikidata_URL", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "objectWikidata_URL",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_allowsMissingTags() throws {
        let data = removeJSON_Key(key: "tags", from: MetObject.testData())
        let metObject = MetObject.loadPreview(from: data)
        XCTAssertNotNil(metObject)
    }

    func test_decoding_allowsMissingConstituents() throws {
        let data = removeJSON_Key(key: "constituents", from: MetObject.testData())
        let metObject = MetObject.loadPreview(from: data)
        XCTAssertNotNil(metObject)
    }

}
