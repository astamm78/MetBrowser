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

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func test_departmentsLoadOnInit() throws {
        Task {
            let vm = LandingViewModel.preview
            XCTAssertTrue(vm.departments.count > 0)
        }
    }
    
    func test_highlightsLoadOnInit() throws {
        Task {
            let vm = LandingViewModel.preview
            XCTAssertNotNil(vm.paginatedObjectIDs)
        }
    }
    
    func test_servicesLoadOnInit() throws {
        Task {
            let vm = LandingViewModel.preview
            XCTAssertNotNil(vm.departmentService)
            XCTAssertNotNil(vm.objectService)
            XCTAssertNotNil(vm.searchService)
        }
    }
    
    func test_loadNextPage() throws {
        Task {
            let vm = LandingViewModel.preview
            XCTAssertEqual(vm.currentPage, 1)
            await vm.loadNextPage()
            XCTAssertEqual(vm.currentPage, 2)
        }
    }
    
    func test_showViewMoreButton() throws {
        // If current page is less than total pages, return true
        Task {
            let vm = LandingViewModel.preview
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
            let vm = LandingViewModel.preview
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
            let vm = LandingViewModel.preview
            vm.currentPage = 0
            
            XCTAssertFalse(vm.showViewMoreButton)
        }
    }

}
