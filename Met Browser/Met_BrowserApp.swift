//
//  Met_BrowserApp.swift
//  Met Browser
//
//  Created by Andrew Stamm on 3/4/25.
//

import SwiftUI

@main
struct Met_BrowserApp: App {
    var body: some Scene {
        WindowGroup {
            LandingView()
                .environmentObject(LandingViewModel())
        }
    }
}
