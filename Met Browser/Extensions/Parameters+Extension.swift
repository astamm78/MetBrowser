//
//  Parameters+Extension.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation
import Alamofire

extension Parameters {
    func asQueryString() -> String {
        var encodedParams: [String] = []
        
        for (key, value) in self {
            encodedParams.append("\(key)=\(value)")
        }
        
        return "?\(encodedParams.joined(separator: "&"))"
    }
}
