//
//  ContentView.swift
//  Set
//
//  Created by john agate on 6/15/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: SetGameVM
    
    var body: some View {
        VStack {
            HStack {
                Text("Time to play Set!")
                    .font(.largeTitle)
                    .multilineTextAlignment(.leading)
                Spacer()
            }.padding(.horizontal)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach((viewModel.cards)) { card in
                        CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }.padding(.horizontal)
            
            HStack {
                Button(action: {}) {
                    Text("New Game")
                }
                Spacer()
                Button(action: {}) {
                    Text("Deal Three")
                }
            }.padding(10).buttonStyle(.bordered)
            
        }
        
    }
}

struct CardView: View {
    let card: SetGame.Card
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameVM()
        ContentView(viewModel: game)
    }
}
