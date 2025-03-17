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
            networkingHandler: MockNetworkingHandler()
        )
        
        vm.departments = [
            Department(departmentId: 1, displayName: "American Decorative Arts"),
            Department(departmentId: 2, displayName: "Ancient Near Eastern Art"),
            Department(departmentId: 3, displayName: "Arms and Armor")
        ]
        
        vm.dataLoading = false

        return vm
    }
    
}
