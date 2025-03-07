//
//  Previewable.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import Foundation

protocol Previewable {
    associatedtype PreviewType: Codable
    static var preview: PreviewType { get }
}

extension Previewable {
    static var preview: PreviewType {
        return loadPreview(from: String(describing: PreviewType.self))
    }

    static func customPreview(from filename: String) -> PreviewType {
        return loadPreview(from: filename)
    }
    
    static func testData(from filename: String = String(describing: PreviewType.self)) -> Data {
        let url = Bundle.main.url(forResource: filename, withExtension: "json")!
        return try! Data(contentsOf: url)
    }
    
    static func loadPreview(from data: Data) -> PreviewType {
        let object: PreviewType = try! JSONDataHandler.shared.decodeData(data)
        return object
    }

    static func loadPreview(from filename: String) -> PreviewType {
        let data = testData(from: filename)
        return loadPreview(from: data)
    }
}
