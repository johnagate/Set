//
//  ContentView.swift
//  Set
//
//  Created by john agate on 6/15/22.
//

import SwiftUI

let cards = Set([0...10])

struct ContentView: View {
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
                    ForEach((1...81), id: \.self) { _ in
                        CardView().aspectRatio(2/3, contentMode: .fit)
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
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
