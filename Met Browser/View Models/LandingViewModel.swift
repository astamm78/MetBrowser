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
    @Published var metObjects: [MetObject] = []
    
    /// For SwiftUI Previews Only
    ///
    init(departments: [Department]) {
        self.departments = departments
    }
    
    init() {
        Task {
            await loadDepartments()
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
    
    func search() async {
        do {
            let results = try await ObjectService.getObjectIDs(deptIDs: [self.selectedDepartmentID], metadataDate: "2024-01-01")
            await self.handleObjectIDs(results.objectIDs)
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
        let _objectIDs = Array(objectIDs.prefix(20))

        var metObjects: [MetObject] = []
        
        for objectId in _objectIDs {
            do {
                async let metObject = ObjectService.getObjectDetail(objectID: objectId)
                metObjects.append(try await metObject)
            } catch {
                print("ERROR - Loading Department \(error)")
            }
        }
        
        self.metObjects = metObjects
    }
}
