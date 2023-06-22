//
//  CardView.swift
//  Memorize
//
//  Created by Sqlink on 6/22/23.
//

import SwiftUI

struct CardView: View {
    
    var card: MemoryGame<String>.Card;
    
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(
                cornerRadius: 20
            );
            
            if card.isFaceUp  && !card.isMatched { shape
                .fill()
                .foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else if  !card.isFaceUp {
                shape.fill();
            } else {
//                shape.fill(.clear);
                shape.opacity(0)
            }
            
        }
        
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EmojiMemoryGame();
        
        CardView(card: viewModel.cards[0])
    }
}
