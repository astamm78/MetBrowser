//
//  Met_BrowserUITestsLaunchTests.swift
//  Met BrowserUITests
//
//  Created by Andrew Stamm on 3/4/25.
//

import XCTest

final class Met_BrowserUITestsLaunchTests: XCTestCase {
    
    private var app: XCUIApplication!

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launchArguments.append(UITestArguments.mockNetworkResponses)
        app.launch()
    }

    @MainActor
    func test_landingScreen() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
