//
//  DepartmentsResponse.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation

struct DepartmentsResponse: Codable {
    var departments: [Department]
}

struct Department: Codable {
    var departmentId: Int
    var displayName: String
}
