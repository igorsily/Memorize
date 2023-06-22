//
//  MemoryGame.swift
//  Memorize
//
//  Created by Sqlink on 6/23/23.
//

import Foundation



struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: [Card]
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?;
    
    init(numberOfPairOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>();
        
        for parIndex in 0..<numberOfPairOfCards {
            let content: CardContent = createCardContent(parIndex);
            cards.append(Card(content: content, id: parIndex * 2))
            cards.append(Card(content: content, id: parIndex * 2 + 1))
            
        }
        
    }
    
    mutating func choose (_ card: Card){
        
        if let chosenIndex = self.cards
            .firstIndex(where: { $0.id == card.id})
            ,!cards[chosenIndex].isFaceUp
            ,!cards[chosenIndex].isMatched {
            
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true;
                    cards[potentialMatchIndex].isMatched = true;
                }
                
                indexOfTheOneAndOnlyFaceUpCard = nil;
                
            } else {
                
                for index in cards.indices {
                    
                    if(!cards[index].isMatched) {
                        cards[index].isFaceUp = false;
                    }
                }
                
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex;
            }
            
            
            self.cards[chosenIndex].isFaceUp.toggle();
            
        }
        
        
    }
    
    func index(of card: Card) -> Int? {
        
        for index in 0..<cards.count {
            
            if cards[index].id == card.id {
                return index;
            }
        }
        
        return nil;
        
    }
    
    struct Card: Identifiable {
        
        var isFaceUp: Bool = false;
        
        var isMatched: Bool = false;
        
        var content: CardContent;
        
        var id: Int
    }
    
}
