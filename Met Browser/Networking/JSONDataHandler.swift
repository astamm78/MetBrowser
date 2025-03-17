//
//  JSONDataHandler.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation
import OSLog

enum JSONDataHandlerError: Error, Equatable {
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
        Logger.codable.info("JSON: \(String(describing: json))")
        
        do {
            let responseObject: T = try JSONDecoder().decode(T.self, from: data)
            return responseObject
        } catch {
            Logger.codable.error("### DESERIALIZATION ERROR :: \(String(describing: T.self))")
            Logger.codable.error("### \(String(describing: error))")
            throw JSONDataHandlerError.deserializationError(class: String(describing: T.self))
        }
    }
}
