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
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach((viewModel.cards)) { card in
                        CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }.padding(.horizontal)
            HStack {
                Spacer()
                Button(action: {print(viewModel.cards[0].numShapes)}) {
                    Text("New Game")
                }
                Spacer()
                Button(action: {}) {
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
        ContentView(viewModel: game)
    }
}
