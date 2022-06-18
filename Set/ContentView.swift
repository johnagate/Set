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
                Button(action: {print(viewModel.cards[0].numShapes)}) {
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
    
    var fontColor: Color {
        switch card.color {
        case .red:
            return .red
        case .purple:
            return .purple
        case .green:
            return .green
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let cardShape = RoundedRectangle(cornerRadius: geometry.size.height * 0.15)
                cardShape.fill().foregroundColor(.white)
                cardShape.strokeBorder(lineWidth: geometry.size.height * 0.02)
                VStack {
                    ForEach(1...card.numShapes, id: \.self) { _ in
                        RoundedRectangle(cornerRadius: geometry.size.height * 0.075)
                            .padding(.horizontal, 0)
                            .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.15)
                            .aspectRatio(2/1, contentMode: .fit)
                            .foregroundColor(fontColor)
                    }
                }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            }
    //            Text(String(card.id)).font(.largeTitle).foregroundColor(.black)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameVM()
        ContentView(viewModel: game)
    }
}
