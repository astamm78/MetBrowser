//
//  Logger+Extension.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/9/25.
//

import Foundation
import OSLog

extension Logger {
    private static let subsystem = Bundle.main.bundleIdentifier ?? "com.andrewstamm.metbrowser"
    static let network = Logger(subsystem: subsystem, category: "network")
    static let codable = Logger(subsystem: subsystem, category: "codable")
    static let viewModels = Logger(subsystem: subsystem, category: "viewmodels")
    static let views = Logger(subsystem: subsystem, category: "views")
    static let app = Logger(subsystem: subsystem, category: "app")
} 
