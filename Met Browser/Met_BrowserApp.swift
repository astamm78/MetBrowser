//
//  Met_BrowserApp.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import SwiftUI

@main
struct Met_BrowserApp: App {
    var networkingHandler: NetworkingHandlerProtocol!
    
    init() {
        configureNetwork()
    }
    
    var body: some Scene {
        WindowGroup {
            LandingView()
                .environmentObject(LandingViewModel(networkingHandler: networkingHandler))
        }
    }
}

extension Met_BrowserApp {
    fileprivate mutating func configureNetwork() {
        let args = CommandLine.arguments
        
        networkingHandler = args.contains(UITestArguments.mockNetworkResponses) ? MockNetworkingHandler() : NetworkingHandler()
    }
}
