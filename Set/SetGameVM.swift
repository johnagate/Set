//
//  SetGameVM.swift
//  Set
//
//  Created by john agate on 6/16/22.
//

import SwiftUI

class SetGameVM: ObservableObject {
    typealias Card = SetGame.Card
    
    @Published private var model: SetGame
    
    init() {
        model = SetGameVM.createGame()
    }
    
    static func createGame() -> SetGame{
        return SetGame()
    }
    
    var deltCards: Array<SetGame.Card> {
        model.deltCards
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func newGame() {
        model.newGame()
    }
    
    func dealThree() {
        model.dealThree()
    }
}
