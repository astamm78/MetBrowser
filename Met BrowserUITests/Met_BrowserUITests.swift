//
//  Met_BrowserUITests.swift
//  Met BrowserUITests
//
//  Created by Andrew Stamm on 3/4/25.
//

import XCTest

@MainActor
final class Met_BrowserUITests: XCTestCase {

    private var app: XCUIApplication!
    private var landingView: LandingView!

    override func setUpWithError() throws {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launchArguments.append(UITestArguments.mockNetworkResponses)
        app.launch()
        
        landingView = LandingView(app: app)
    }

    override func tearDownWithError() throws {
        app = nil
        landingView = nil
    }
    
    func test_landingViewLoads() throws {
        landingView
            .verifyHeaderAppears()
            .verifyHighlightsHeader()
    }
    
    func test_departmentOptionsDisplay() throws {
        landingView
            .tapDepartmentsDropdown()
            .verifyDepartmentOptions()
    }
    
    func test_selectingDepartmentUpdatesResultsHeader() throws {
        landingView
            .verifyHighlightsHeader()
            .tapDepartmentsDropdown()
            .selectDropdownOption()
            .verifySearchResultsHeader()
    }
    
    func test_searchingForTermUpdatesResultsHeader() throws {
        landingView
            .verifyHighlightsHeader()
            .enterSearchTerm("Testing")
            .tapSearchButton()
            .verifySearchResultsHeader()
    }
    
    func test_tappingObjectCellLoadsDetailView() throws {
        landingView
            .tapObjectCell()
            .verifyObjectDetailView()
    }
}
