//
//  String+Extension.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/8/25.
//

import Foundation

extension String {
    
    func htmlCleaned() -> String {
        let regex = /(<([^>]+)>)/
        return self.replacing(regex, with: "")
    }
    
}
