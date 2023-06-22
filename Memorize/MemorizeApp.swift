//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Sqlink on 6/22/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    let game = EmojiMemoryGame();
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
