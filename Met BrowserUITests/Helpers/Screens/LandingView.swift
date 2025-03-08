//
//  LandingView.swift
//  Met BrowserUITests
//
//  Created by Andrew Stamm on 3/7/25.
//

import XCTest

struct LandingView: Screen {
    let app: XCUIApplication
    
    func enterSearchTerm(_ term: String) -> Self {
        let searchInput = app.textFields[TestingIdentifiers.LandingView.searchBar]
        searchInput.tap()
        searchInput.typeText(term)
        return self
    }
    
    func tapSearchButton() -> Self {
        app.buttons[TestingIdentifiers.LandingView.searchButton].tap()
        return self
    }
    
    func tapDepartmentsDropdown() -> Self {
        let dropdown = app.buttons[TestingIdentifiers.LandingView.departmentsDropdown]
        dropdown.tap()
        return self
    }
    
    func selectDropdownOption() -> Self {
        let dropdownOptions = app.buttons.matching(identifier: TestingIdentifiers.LandingView.dropdownOption)
        dropdownOptions.firstMatch.tap()
        return self
    }
    
    func tapObjectCell() -> MetObjectDetail {
        let objectCells = app.buttons.matching(identifier: TestingIdentifiers.LandingView.objectCell)
        objectCells.firstMatch.tap()
        sleep(3)
        return MetObjectDetail(app: app)
    }
    
    @discardableResult func verifyHeaderAppears() -> Self {
        let header = app.staticTexts[TestingIdentifiers.LandingView.headerText]
        XCTAssertTrue(header.exists)
        return self
    }
    
    @discardableResult func verifyDepartmentOptions() -> Self {
        let buttons = app.buttons.matching(identifier: TestingIdentifiers.LandingView.departmentsDropdown)
        XCTAssertTrue(buttons.count > 0)
        return self
    }
    
    @discardableResult func verifySearchResultsHeader() -> Self {
        let resultsHeader = app.staticTexts[TestingIdentifiers.LandingView.listHeader]
        XCTAssertEqual(resultsHeader.label, "Search Results")
        return self
    }
    
    @discardableResult func verifyHighlightsHeader() -> Self {
        let resultsHeader = app.staticTexts[TestingIdentifiers.LandingView.listHeader]
        XCTAssertEqual(resultsHeader.label, "Met Highlights")
        return self
    }
}
