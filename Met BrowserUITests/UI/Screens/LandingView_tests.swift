//
//  LandingView_tests.swift
//  Met BrowserUITests
//
//  Created by Andrew Stamm on 3/7/25.
//

import XCTest

final class LandingView_tests: XCTestCase {

    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launchArguments.append(UITestArguments.mockNetworkResponses)
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    @MainActor
    func test_headerAppears() throws {
        LandingView(app: app)
            .verifyHeaderAppears()
    }
    
    @MainActor
    func test_departmentOptionsDisplay() throws {
        LandingView(app: app)
            .tapDepartmentsDropdown()
            .verifyDepartmentOptions()
    }
}
