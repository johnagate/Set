//
//  SetApp.swift
//  Set
//
//  Created by john agate on 6/15/22.
//

import SwiftUI

@main
struct SetApp: App {
    var body: some Scene {
        let game = SetGameVM()
        WindowGroup {
            ContentView(game: game)
        }
    }
}
