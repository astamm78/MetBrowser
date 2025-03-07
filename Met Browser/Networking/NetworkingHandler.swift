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
    case decodingError(dataError: JSONDataHandlerError)
    case mockNetworkError
}

protocol NetworkingHandlerProtocol {
    func request<T: Codable>(endpoint: MetEndpoint) async throws -> T
}

struct NetworkingHandler: NetworkingHandlerProtocol {
    func request<T: Codable>(endpoint: MetEndpoint) async throws -> T {
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
                    do {
                        let obj: T = try JSONDataHandler.shared.decodeData(data)
                        continuation.resume(returning: obj)
                    } catch {
                        continuation.resume(
                            throwing: NetworkingHandlerError.decodingError(dataError: error as! JSONDataHandlerError)
                        )
                    }
                case let .failure(error):
                    continuation.resume(throwing: NetworkingHandlerError.responseError(afError: error))
                }
            }
        }
    }
}
