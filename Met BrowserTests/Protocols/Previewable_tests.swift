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
        XCTAssertTrue(type(of: Constituent.preview) == Constituent.self)
    }
    
    func test_DepartmentsResponsePreview() throws {
        XCTAssertNotNil(DepartmentsResponse.preview)
        XCTAssertTrue(type(of: DepartmentsResponse.preview) == DepartmentsResponse.self)
    }
    
    func test_DepartmentPreview() throws {
        XCTAssertNotNil(Department.preview)
        XCTAssertTrue(type(of: Department.preview) == Department.self)
    }
    
    func test_MetObjectPreview() throws {
        XCTAssertNotNil(MetObject.preview)
        XCTAssertTrue(type(of: MetObject.preview) == MetObject.self)
    }
    
    func test_ObjectsResponsePreview() throws {
        XCTAssertNotNil(ObjectsResponse.preview)
        XCTAssertTrue(type(of: ObjectsResponse.preview) == ObjectsResponse.self)
    }
    
    func test_TagPreview() throws {
        XCTAssertNotNil(Tag.preview)
        XCTAssertTrue(type(of: Tag.preview) == Tag.self)
    }
}
