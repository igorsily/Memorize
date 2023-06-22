//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sqlink on 6/23/23.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    
    static let emojis: Array<String> = [
        "🍏","🍎","🍐","🍊",
        "🍋","🍌","🍉","🍇",
        "🍓","🫐","🍈","🍒",
        "🍑","🥭","🍍","🥥",
    ];
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairOfCards: 4){ parIndex  in emojis[parIndex] };
    }
    
   @Published private var model: MemoryGame<String> = createMemoryGame();
    
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards;
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card);
    }
    
    
    
}
