//
//  MetObjectDetail.swift
//  Met BrowserUITests
//
//  Created by Andrew Stamm on 3/8/25.
//

import XCTest

struct MetObjectDetail: Screen {
    let app: XCUIApplication
    
    @discardableResult func verifyObjectDetailView() -> Self {
        let imageDetail = app.buttons[TestingIdentifiers.MetObjectDetail.imageDetail]
        XCTAssertTrue(imageDetail.exists)
        return self
    }
}
