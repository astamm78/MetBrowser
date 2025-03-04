//
//  Constituent.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation

struct Constituent: Codable {
    var constituentID: Int
    var role: String
    var name: String
    var constituentULAN_URL: String
    var constituentWikidata_URL: String
    var gender: String
}
