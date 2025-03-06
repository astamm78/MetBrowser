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
        vm.metObjects = MetObjectCollection.customPreview(from: "MetObjectCollection")
        return vm
    }
    
}
