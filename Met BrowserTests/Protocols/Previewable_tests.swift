//
//  Previewable_tests.swift
//  Met BrowserTests
//
//  Created by Andrew Stamm on 3/4/25.
//

import XCTest
@testable import Met_Browser

final class Previewable_tests: XCTestCase {
    func test_ConstituentPreview() throws {
        XCTAssertNotNil(Constituent.preview)
    }
    
    func test_DepartmentsResponsePreview() throws {
        XCTAssertNotNil(DepartmentsResponse.preview)
    }
    
    func test_DepartmentPreview() throws {
        XCTAssertNotNil(Department.preview)
    }
    
    func test_MetObjectPreview() throws {
        XCTAssertNotNil(MetObject.preview)
    }
    
    func test_ObjectsResponsePreview() throws {
        XCTAssertNotNil(ObjectsResponse.preview)
    }
    
    func test_TagPreview() throws {
        XCTAssertNotNil(Tag.preview)
    }
}
