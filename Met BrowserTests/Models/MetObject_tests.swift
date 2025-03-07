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
    
    func test_primaryImageURL() throws {
        var metObject = MetObject.preview
        
        // When primaryImage is present
        XCTAssertNotNil(metObject.primaryImageURL)
        XCTAssertTrue(type(of: metObject.primaryImageURL) == URL?.self, "Expected to be of type URL")
        
        // When primaryImage is an empty string
        metObject.primaryImage = ""
        XCTAssertNil(metObject.primaryImageURL)
    }
    
    func test_primaryImageSmallURL() throws {
        var metObject = MetObject.preview
        
        // When primaryImageSmall is present
        XCTAssertNotNil(metObject.primaryImageSmallURL)
        XCTAssertTrue(type(of: metObject.primaryImageSmallURL) == URL?.self, "Expected to be of type URL")
        
        // When primaryImageSmall is an empty string
        metObject.primaryImageSmall = ""
        XCTAssertNil(metObject.primaryImageSmallURL)
    }
    
    func test_additionalImagesUrls() throws {
        var metObject = MetObject.preview
        
        // When additionalImages is present
        XCTAssertNotNil(metObject.additionalImagesUrls)
        XCTAssertTrue(type(of: metObject.additionalImagesUrls) == [URL?]?.self, "Expected to be of type [URL]")
        
        // When additionalImages is an empty array
        metObject.additionalImages = []
        XCTAssertNil(metObject.additionalImagesUrls)
    }
    
    func test_displayURL() throws {
        var metObject = MetObject.preview
        
        // When primaryImage is present
        XCTAssertNotNil(metObject.displayURL)
        XCTAssertTrue(type(of: metObject.displayURL) == URL?.self, "Expected to be of type URL")
        XCTAssertEqual(metObject.displayURL, metObject.primaryImageURL)
        
        // When primaryImage is absent, primaryImageSmall is pressent
        metObject.primaryImage = ""
        XCTAssertNotNil(metObject.displayURL)
        XCTAssertTrue(type(of: metObject.displayURL) == URL?.self, "Expected to be of type URL")
        XCTAssertEqual(metObject.displayURL, metObject.primaryImageSmallURL)
        
        // When primaryImage is absent, primaryImageSmall is absent, additionalImages are present
        metObject.primaryImageSmall = ""
        let firstAdditionalImage = metObject.additionalImagesUrls?.first
        XCTAssertNotNil(metObject.displayURL)
        XCTAssertTrue(type(of: metObject.displayURL) == URL?.self, "Expected to be of type URL")
        XCTAssertEqual(metObject.displayURL, firstAdditionalImage)
        
        // When all options are absent
        metObject.additionalImages = []
        XCTAssertNil(metObject.displayURL)
    }
    
    func test_wikidataURL() throws {
        var metObject = MetObject.preview
        
        // When objectWikidata_URL is present
        XCTAssertNotNil(metObject.wikidataURL)
        XCTAssertTrue(type(of: metObject.wikidataURL) == URL?.self, "Expected to be of type URL")
        
        // When objectWikidata_URL is an empty string
        metObject.objectWikidata_URL = ""
        XCTAssertNil(metObject.wikidataURL)
    }

}
