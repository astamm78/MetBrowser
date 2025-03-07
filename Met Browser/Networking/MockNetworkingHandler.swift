//
//  MockNetworkingHandler.swift
//  Met BrowserTests
//
//  Created by Andrew Stamm on 3/7/25.
//

import Foundation

struct MockNetworkingHandler: NetworkingHandlerProtocol {
    func request<T: Codable>(endpoint: MetEndpoint) async throws -> T {
        print("### RETURNING MOCK DATA")
        let filename = String(describing: T.self)
        let url = Bundle.main.url(forResource: filename, withExtension: "json")!
        let data = try Data(contentsOf: url)
        let obj: T = try JSONDataHandler.shared.decodeData(data)
        return obj
    }
}
