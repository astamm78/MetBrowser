//
//  Array+Extension.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/5/25.
//

import Foundation

extension Array {
    func chunked(_ chunkSize: Int) -> [Array] {
        return stride(from: 0, to: self.count, by: chunkSize).map {
            Array(self[$0..<Swift.min($0 + chunkSize, self.count)])
        }
    }
}
