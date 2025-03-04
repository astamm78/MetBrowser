//
//  DepartmentsResponse.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation

struct DepartmentsResponse: Codable, Previewable {
    typealias PreviewType = DepartmentsResponse
    
    var departments: [Department]
}

struct Department: Codable, Previewable {
    typealias PreviewType = Department
    
    var departmentId: Int
    var displayName: String
}
