//
//  JSONDataHandler_tests.swift
//  Met BrowserTests
//
//  Created by Andrew Stamm on 3/7/25.
//

import XCTest
@testable import Met_Browser

final class JSONDataHandler_tests: XCTestCase {

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func test_throwsErrorWithEmptyData() throws {
        func missingData() throws -> MetObject {
            let obj: MetObject = try JSONDataHandler.shared.decodeData(nil)
            return obj
        }
        
        XCTAssertThrowsError(try missingData(), "some message") { (error) in
            XCTAssertEqual(error as? JSONDataHandlerError, JSONDataHandlerError.emptyDataError)
        }
    }
    
    func test_throwsErrorWhenCantDecode() throws {
        func dataMismatch() throws -> MetObject {
            let data = DepartmentsResponse.testData()
            let obj: MetObject = try JSONDataHandler.shared.decodeData(data)
            return obj
        }
        
        XCTAssertThrowsError(try dataMismatch(), "some message") { (error) in
            XCTAssertEqual(error as? JSONDataHandlerError, JSONDataHandlerError.deserializationError(class: "MetObject"))
        }
    }

}
