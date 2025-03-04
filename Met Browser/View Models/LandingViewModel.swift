//
//  LandingViewModel.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation
import SwiftUICore

class LandingViewModel: ObservableObject {
    @Published var departments: [Department] = []
    @Published var selectedDepartmentID: Int = 0
    @Published var searchTerm: String = ""
    @Published var metObjects: [MetObject] = []
    
    var selectedDepartment: Department? {
        return departments.first(where: { $0.departmentId == selectedDepartmentID })
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
            await self.handleDepartments(departmentsResponse.departments)
        } catch {
            print("ERROR - Loading Departments \(error)")
        }
    }
    
    fileprivate func loadHighlights() async {
        do {
            let results = try await ObjectService.getOilPaintingHighlights()
            await self.handleObjectIDs(results.objectIDs ?? [])
        } catch {
            
        }
    }
    
    func search() async {
        do {
            let results = try await SearchService.search(term: searchTerm, deptID: selectedDepartmentID)
            await self.handleObjectIDs(results.objectIDs ?? [])
        } catch {
            print("ERROR - Loading Department \(error)")
        }
    }
    
    @MainActor
    fileprivate func handleDepartments(_ departments: [Department]) {
        self.departments = departments
    }
    
    @MainActor
    fileprivate func handleObjectIDs(_ objectIDs: [Int]) async {
        var metObjects: [MetObject] = []
        
        for objectId in objectIDs.shuffled() {
            print("RESULTS COUNT :: \(metObjects.count)")
            guard metObjects.count < 10 else { break }
            
            do {
                let metObject = try await ObjectService.getObjectDetail(objectID: objectId)
                metObjects.append(metObject)
            } catch {
                print("ERROR - Loading Department \(error)")
            }
        }
        
        self.metObjects = metObjects
    }
}
