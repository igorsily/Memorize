//
//  ContentView.swift
//  Memorize
//
//  Created by Sqlink on 6/22/23.
//

import SwiftUI

struct ContentView: View {
    
   @ObservedObject var viewModel: EmojiMemoryGame;
    
    var body: some View {
        
        ScrollView{
            LazyVGrid(columns: [
                GridItem(
                    .adaptive(minimum: 85
                             )
                ),
            ]
            ){
                ForEach(
                    viewModel.cards)
                { card in
                    CardView(card: card)
                        .aspectRatio(
                            2/3,
                            contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card);
                        }
                }
                
            }
        }
        
        .padding(.horizontal)
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let game = EmojiMemoryGame();
        
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
