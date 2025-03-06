//
//  LandingViewModel.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation
import SwiftUICore

@MainActor
class LandingViewModel: ObservableObject {
    @Published var departments: [Department] = []
    @Published var selectedDepartmentID: Int = 0
    @Published var searchTerm: String = ""
    @Published var metObjects: [MetObject] = []
    @Published var dataLoading: Bool = true
    @Published var paginatedObjectIDs: PaginatedObjectIDs?
    @Published var currentPage: Int = 0
    
    var selectedDepartment: Department? {
        return departments.first(where: { $0.departmentId == selectedDepartmentID })
    }
    
    var showViewMoreButton: Bool {
        guard let paginatedObjectIDs,
              currentPage != 0 else { return false }
        
        return currentPage < paginatedObjectIDs.totalPages
    }
    
    /// For SwiftUI Previews Only
    ///
    init(departments: [Department]) {
        self.departments = departments
    }
    
    init() {
        Task {
            await loadDepartments()
            await loadHighlights()
        }
    }
    
    fileprivate func loadDepartments() async {
        do {
            let departmentsResponse = try await DepartmentService.getDepartments()
            self.departments = departmentsResponse.departments
        } catch {
            print("ERROR - Loading Departments \(error)")
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
            let objectsResponse = try await ObjectService.getOilPaintingHighlights()
            await self.handledObjectsResponse(objectsResponse, shuffled: true)
        } catch {
            print("ERROR - Loading Highlights \(error)")
            dataLoading = false
        }
    }
    
    func search() async {
        resetView()
        
        do {
            let objectsResponse = try await SearchService.search(term: searchTerm, deptID: selectedDepartmentID)
            await self.handledObjectsResponse(objectsResponse)
        } catch {
            print("ERROR - Loading Department \(error)")
            dataLoading = false
        }
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
        
        var mutableMetObjects = self.metObjects
        
        for objectId in objectIDs {
            do {
                let metObject = try await ObjectService.getObjectDetail(objectID: objectId)
                mutableMetObjects.append(metObject)
            } catch {
                print("ERROR - Loading Object \(error)")
            }
        }
        
        self.currentPage = page
        self.metObjects = mutableMetObjects
        dataLoading = false
    }
}
