//
//  LandingViewModel_tests.swift
//  Met BrowserTests
//
//  Created by Andrew Stamm on 3/7/25.
//

import XCTest
import OSLog
@testable import Met_Browser

@MainActor
final class LandingViewModel_tests: XCTestCase {
    
    var vm: LandingViewModel!

    override func setUpWithError() throws {
        vm = LandingViewModel.preview
    }

    override func tearDownWithError() throws {
        vm = nil
    }

    func test_departmentsLoadOnInit() async throws {
        await vm.loadInitialData()
        XCTAssertTrue(vm.departments.count > 0)
    }
    
    func test_highlightsLoadOnInit() async throws {
        await vm.loadInitialData()
        XCTAssertNotNil(vm.paginatedObjectIDs)
    }
    
    func test_servicesLoadOnInit() async throws {
        await vm.loadInitialData()
        XCTAssertNotNil(vm.departmentService)
        XCTAssertNotNil(vm.objectService)
        XCTAssertNotNil(vm.searchService)
    }
    
    func test_loadNextPage() async throws {
        XCTAssertEqual(vm.currentPage, 0, "Initial current page should be 0")
        
        await vm.loadInitialData()
        
        XCTAssertNotNil(vm.paginatedObjectIDs, "Paginated object IDs should be initialized")
        XCTAssertEqual(vm.currentPage, 1, "Current page should be 1 after initial load")
        
        let initialPage = vm.currentPage
        
        await vm.loadNextPage()
        
        XCTAssertEqual(vm.currentPage, initialPage + 1, "Current page should increment by 1")
    }
    
    func test_deptFilterOn() async throws {
        await vm.loadInitialData()
        vm.selectedDepartmentID = 0
        XCTAssertFalse(vm.deptFilterOn)
        
        vm.selectedDepartmentID = 1
        XCTAssertTrue(vm.deptFilterOn)
    }
    
    func test_showViewMoreButton() async throws {
        // If current page is 0, return false
        vm.currentPage = 0
        XCTAssertFalse(vm.showViewMoreButton)
        
        // If current page is less than total pages, return true
        await vm.loadInitialData()
        XCTAssertTrue(vm.showViewMoreButton)
        
        // If current page is not less than total pages, return false
        await vm.loadNextPage()
        XCTAssertTrue(vm.showViewMoreButton)
    }
    
    func test_clearTermAndSearch() async throws {
        await vm.loadInitialData()
        vm.searchTerm = "Testing"
        vm.resultsMode = .searchResults
        
        await vm.clearTermAndSearch()
        
        XCTAssertEqual(vm.searchTerm, "")
        XCTAssertEqual(vm.resultsMode, .highlights)
    }
    
    func test_search_updatedResultsMode() async throws {
        await vm.loadInitialData()
        XCTAssertEqual(vm.resultsMode, .highlights)
        
        vm.searchTerm = "Testing"
        await vm.search()
        
        XCTAssertEqual(vm.resultsMode, .searchResults)
    }
    
    func test_searchUpdatesResultsMode() async throws {
        await vm.loadInitialData()
        vm.resultsMode = .highlights
        vm.searchTerm = "Van Gogh"
        await vm.search()
        XCTAssertEqual(vm.resultsMode, .searchResults)
    }
    
    func test_loadHighlightsUpdatesResultsMode() async throws {
        await vm.loadInitialData()
        vm.resultsMode = .searchResults
        vm.selectedDepartmentID = 0
        vm.searchTerm = ""
        await vm.search()
        XCTAssertEqual(vm.resultsMode, .highlights)
    }
}
