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
        let data = removeKey("objectID", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "objectID",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingIsHighlight() throws {
        let data = removeKey("isHighlight", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "isHighlight",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingAccessionYear() throws {
        let data = removeKey("accessionYear", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "accessionYear",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingPrimaryImage() throws {
        let data = removeKey("primaryImage", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "primaryImage",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingPrimaryImageSmall() throws {
        let data = removeKey("primaryImageSmall", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "primaryImageSmall",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingAdditionalImages() throws {
        let data = removeKey("additionalImages", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "additionalImages",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingDepartment() throws {
        let data = removeKey("department", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "department",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingTitle() throws {
        let data = removeKey("title", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "title",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingCulture() throws {
        let data = removeKey("culture", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "culture",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingPeriod() throws {
        let data = removeKey("period", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "period",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingDynasty() throws {
        let data = removeKey("dynasty", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "dynasty",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingObjectDate() throws {
        let data = removeKey("objectDate", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "objectDate",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingMedium() throws {
        let data = removeKey("medium", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "medium",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingDimensions() throws {
        let data = removeKey("dimensions", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "dimensions",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_missingObjectWikidataURL() throws {
        let data = removeKey("objectWikidata_URL", from: MetObject.testData())

        AssertThrowsKeyNotFound(
            "objectWikidata_URL",
            decoding: MetObject.self,
            from: data
        )
    }

    func test_decoding_allowsMissingTags() throws {
        let data = removeKey("tags", from: MetObject.testData())
        let metObject = MetObject.loadPreview(from: data)
        XCTAssertNotNil(metObject)
    }

    func test_decoding_allowsMissingConstituents() throws {
        let data = removeKey("constituents", from: MetObject.testData())
        let metObject = MetObject.loadPreview(from: data)
        XCTAssertNotNil(metObject)
    }

}
