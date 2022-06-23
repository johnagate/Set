//
//  ContentView.swift
//  Set
//
//  Created by john agate on 6/15/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var game: SetGameVM
    
    var body: some View {
        VStack {
            HStack {
                Text("Time to play Set!")
                    .font(.largeTitle)
                    .multilineTextAlignment(.leading)
                Spacer()
            }.padding(.horizontal)
            AspectVGrid(items: game.deltCards, aspectRatio: 2/3) { card in
                CardView(card: card).padding(5).onTapGesture {
                    game.choose(card)
                }
            }.padding(5)
            HStack {
                Spacer()
                Button(action: {game.newGame()}) {
                    Text("New Game")
                }
                Spacer()
                Button(action: {game.dealThree()}) {
                    Text("Deal Three")
                }
                Spacer()
            }.buttonStyle(.bordered)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameVM()
        ContentView(game: game)
    }
}
