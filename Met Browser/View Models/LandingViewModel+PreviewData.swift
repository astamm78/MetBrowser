//
//  LandingViewModel+PreviewData.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/6/25.
//

import Foundation

extension LandingViewModel {
    
    static var preview: LandingViewModel {
        let vm = LandingViewModel(
            departments: DepartmentsResponse.preview.departments
        )
        
        vm.dataLoading = false
        vm.paginatedObjectIDs = PaginatedObjectIDs(
            totalPages: 2,
            totalObjects: 4,
            pages: [
                PaginatedObjectIDs.Page(page: 1, objectIDs: [352328, 79778, 472562]),
                PaginatedObjectIDs.Page(page: 2, objectIDs: [329077])
            ]
        )
        vm.metObjects = MetObjectCollection.customPreview(from: "MetObjectCollection")
        vm.currentPage = 1
        return vm
    }
    
}
