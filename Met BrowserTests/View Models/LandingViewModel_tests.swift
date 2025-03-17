//
//  LandingViewModel_tests.swift
//  Met BrowserTests
//
//  Created by Andrew Stamm on 3/7/25.
//

import XCTest
@testable import Met_Browser

@MainActor
final class LandingViewModel_tests: XCTestCase {
    
    var vm: LandingViewModel!

    override func setUpWithError() throws {
        Task {
            vm = LandingViewModel.preview
            await vm.loadInitialData()
        }
    }

    override func tearDownWithError() throws {
        vm = nil
    }

    func test_departmentsLoadOnInit() throws {
        Task {
            XCTAssertTrue(vm.departments.count > 0)
        }
    }
    
    func test_highlightsLoadOnInit() throws {
        Task {
            XCTAssertNotNil(vm.paginatedObjectIDs)
        }
    }
    
    func test_servicesLoadOnInit() throws {
        Task {
            XCTAssertNotNil(vm.departmentService)
            XCTAssertNotNil(vm.objectService)
            XCTAssertNotNil(vm.searchService)
        }
    }
    
    func test_loadNextPage() throws {
        Task {
            XCTAssertEqual(vm.currentPage, 1)
            await vm.loadNextPage()
            XCTAssertEqual(vm.currentPage, 2)
        }
    }
    
    func test_deptFilterOn() throws {
        Task {
            vm.selectedDepartmentID = 0
            XCTAssertFalse(vm.deptFilterOn)
            
            vm.selectedDepartmentID = 1
            XCTAssertTrue(vm.deptFilterOn)
        }
    }
    
    func test_showViewMoreButton() throws {
        // If current page is less than total pages, return true
        Task {
            vm.currentPage = 1
            vm.paginatedObjectIDs = PaginatedObjectIDs(
                totalPages: 2,
                totalObjects: 10,
                pages: []
            )
            
            XCTAssertTrue(vm.showViewMoreButton)
        }
        
        // If current page is not less than total pages, return false
        Task {
            vm.currentPage = 2
            vm.paginatedObjectIDs = PaginatedObjectIDs(
                totalPages: 2,
                totalObjects: 10,
                pages: []
            )
            
            XCTAssertTrue(vm.showViewMoreButton)
        }
        
        // If current page is 0, return false
        Task {
            vm.currentPage = 0
            
            XCTAssertFalse(vm.showViewMoreButton)
        }
    }
    
    func test_clearTermAndSearch() throws {
        Task {
            vm.searchTerm = "Testing"
            vm.selectedDepartmentID = 9
            vm.resultsMode = .searchResults
            
            await vm.clearTermAndSearch()
            
            XCTAssertEqual(vm.searchTerm, "")
            XCTAssertEqual(vm.selectedDepartmentID, 0)
            XCTAssertEqual(vm.resultsMode, .highlights)
        }
    }
    
    func test_search_updatedResultsMode() throws {
        Task {
            XCTAssertEqual(vm.resultsMode, .highlights)
            
            vm.searchTerm = "Testing"
            await vm.search()
            
            XCTAssertEqual(vm.resultsMode, .searchResults)
        }
    }
    
    func test_searchUpdatesResultsMode() throws {
        Task {
            vm.resultsMode = .highlights
            await vm.search()
            XCTAssertEqual(vm.resultsMode, .searchResults)
        }
    }
    
    func test_loadHighlightsUpdatesResultsMode() throws {
        Task {
            vm.resultsMode = .searchResults
            vm.selectedDepartmentID = 0
            vm.searchTerm = ""
            await vm.search()
            XCTAssertEqual(vm.resultsMode, .highlights)
        }
    }

}
