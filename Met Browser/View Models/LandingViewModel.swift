//
//  LandingViewModel.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation
import SwiftUICore
import OSLog

@MainActor
class LandingViewModel: ObservableObject {
    enum ResultsMode {
        case highlights, searchResults
        
        var displayText: String {
            switch self {
            case .highlights:
                "Met Highlights"
            case .searchResults:
                "Search Results"
            }
        }
    }
    
    @Published var departments: [Department] = []
    @Published var selectedDepartmentID: Int = 0
    @Published var searchTerm: String = ""
    @Published var metObjects: [MetObject] = []
    @Published var dataLoading: Bool = true
    @Published var paginatedObjectIDs: PaginatedObjectIDs?
    @Published var currentPage: Int = 0
    @Published var resultsMode: ResultsMode = .highlights
    
    let departmentService: DepartmentService!
    let searchService: SearchService!
    let objectService: ObjectService!
    
    var selectedDepartment: Department? {
        return departments.first(where: { $0.departmentId == selectedDepartmentID })
    }
    
    var showViewMoreButton: Bool {
        guard let paginatedObjectIDs,
              currentPage != 0 else { return false }
        
        return currentPage < paginatedObjectIDs.totalPages
    }
    
    var deptFilterOn: Bool {
        selectedDepartmentID != 0
    }
    
    init(networkingHandler: NetworkingHandlerProtocol) {
        self.departmentService = DepartmentService(networkingHandler: networkingHandler)
        self.searchService = SearchService(networkingHandler: networkingHandler)
        self.objectService = ObjectService(networkingHandler: networkingHandler)
    }
    
    func loadInitialData() async {
        await loadDepartments()
        await loadHighlights()
    }
    
    fileprivate func loadDepartments() async {
        do {
            let departmentsResponse = try await departmentService.getDepartments()
            self.departments = departmentsResponse.departments
        } catch {
            Logger.viewModels.error("Failed to load departments: \(error, privacy: .public)")
        }
    }

    fileprivate func resetView() {
        metObjects = []
        dataLoading = true
        currentPage = 0
    }
    
    fileprivate func loadHighlights() async {
        resetView()
        
        do {
            let objectsResponse = try await objectService.getOilPaintingHighlights()
            self.resultsMode = .highlights
            await self.handledObjectsResponse(objectsResponse, shuffled: true)
        } catch {
            Logger.viewModels.error("Failed to load highlights: \(error, privacy: .public)")
            dataLoading = false
        }
    }
    
    func search() async {
        resetView()
        
        if selectedDepartmentID == 0 && searchTerm == "" {
            await loadHighlights()
        } else {
            do {
                let objectsResponse = try await searchService.search(term: searchTerm, deptID: selectedDepartmentID)
                self.resultsMode = .searchResults
                await self.handledObjectsResponse(objectsResponse)
            } catch {
                Logger.viewModels.error("Failed to perform search: \(error, privacy: .public)")
                dataLoading = false
            }
        }
    }
    
    func clearTermAndSearch() async {
        searchTerm = ""
        
        await search()
    }
    
    fileprivate func handledObjectsResponse(_ objectsResponse: ObjectsResponse, shuffled: Bool = false) async {
        self.paginatedObjectIDs = objectsResponse.paginatedObjectIDs(pageSize: 15, shuffled: shuffled)
        await self.loadPage(1)
    }
    
    func loadNextPage() async {
        await loadPage(currentPage + 1)
    }
    
    fileprivate func loadPage(_ page: Int) async {
        guard let paginatedObjectIDs,
              let objectIDs = paginatedObjectIDs.objectIDs(for: page) else { return }
        
        dataLoading = true
        
        for objectId in objectIDs {
            do {
                let metObject = try await objectService.getObjectDetail(objectID: objectId)
                metObjects.append(metObject)
            } catch {
                Logger.viewModels.error("Failed to load object \(objectId, privacy: .public): \(error, privacy: .public)")
            }
        }
        
        self.currentPage = page
        dataLoading = false
    }
}
