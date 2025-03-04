//
//  JSONDataHandler.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation

enum JSONDataHandlerError: Error {
    case emptyDataError
    case deserializationError(class: String)
}

struct JSONDataHandler {
    static var shared = JSONDataHandler()
    
    func decodeData<T: Codable>(_ data: Data?) throws -> T {
        guard let data else {
            throw JSONDataHandlerError.emptyDataError
        }

        let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
        print(json ?? "NO JSON")
        
        do {
            let responseObject: T = try JSONDecoder().decode(T.self, from: data)
            return responseObject
        } catch {
            print("### DESERIALIZATION ERROR :: " + String(describing: T.self))
            print("### " + String(describing: error))
            throw JSONDataHandlerError.deserializationError(class: String(describing: T.self))
        }
    }
}
