//
//  XCTestCase+Extension.swift
//  Met BrowserTests
//
//  Created by Andrew Stamm on 3/7/25.
//

import XCTest

extension XCTestCase {
    
    // Helper function from: https://paul-samuels.com/blog/2019/01/07/swift-codable-testing/
    
    func AssertThrowsKeyNotFound<T: Decodable>(_ expectedKey: String, decoding: T.Type, from data: Data, file: StaticString = #file, line: UInt = #line) {
        XCTAssertThrowsError(try JSONDecoder().decode(decoding, from: data), file: file, line: line) { error in
            if case .keyNotFound(let key, _)? = error as? DecodingError {
                XCTAssertEqual(expectedKey, key.stringValue, "Expected missing key '\(key.stringValue)' to equal '\(expectedKey)'.", file: file, line: line)
            } else {
                XCTFail("Expected '.keyNotFound(\(expectedKey))' but got \(error)", file: file, line: line)
            }
        }
    }
    
    // My own helper function to remove a JSON key from Test Data
    
    func removeJSON_Key(key: String, from data: Data) -> Data {
        var json = try! JSONSerialization.jsonObject(with: data) as? [String: Any]
        json?.removeValue(forKey: key)
        return try! JSONSerialization.data(withJSONObject: json!)
    }
}
