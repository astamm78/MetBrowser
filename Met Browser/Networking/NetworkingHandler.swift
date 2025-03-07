//
//  NetworkingHandler.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation
import Alamofire

enum NetworkingHandlerError: Error {
    case responseError(afError: AFError)
}

actor NetworkingHandler: GlobalActor {
    static var shared = NetworkingHandler()
    
    private init() {}
    
    func request(endpoint: MetEndpoint) async throws -> Data? {
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(
                endpoint.url,
                method: endpoint.method,
                parameters: endpoint.params
            )
            .responseData { response in
                print("URL :: \(String(describing: response.request?.url))")
                
                switch(response.result) {
                case let .success(data):
                    continuation.resume(returning: data)
                case let .failure(error):
                    continuation.resume(throwing: NetworkingHandlerError.responseError(afError: error))
                }
            }
        }
    }
}
