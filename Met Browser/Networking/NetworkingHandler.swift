//
//  NetworkingHandler.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation
import Alamofire
import OSLog

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
                if let url = response.request?.url {
                    Logger.network.debug("Request URL: \(url, privacy: .public)")
                }
                
                switch(response.result) {
                case let .success(data):
                    do {
                        let obj: T = try JSONDataHandler.shared.decodeData(data)
                        continuation.resume(returning: obj)
                    } catch {
                        Logger.network.error("JSON decoding error: \(error as! JSONDataHandlerError, privacy: .public)")
                        continuation.resume(
                            throwing: NetworkingHandlerError.decodingError(dataError: error as! JSONDataHandlerError)
                        )
                    }
                case let .failure(error):
                    Logger.network.error("Network request failed: \(error, privacy: .public)")
                    continuation.resume(throwing: NetworkingHandlerError.responseError(afError: error))
                }
            }
        }
    }
}
