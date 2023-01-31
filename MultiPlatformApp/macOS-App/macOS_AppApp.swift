//
//  macOS_AppApp.swift
//  macOS-App
//
//  Created by Shio Birbichadze on 28.01.23.
//

import SwiftUI

@main
struct macOS_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
        .windowToolbarStyle(.unified)
    }
}
