//
//  SetGameVM.swift
//  Set
//
//  Created by john agate on 6/16/22.
//

import SwiftUI

class SetGameVM: ObservableObject {
    
    @Published private var model: SetGame
    
    init() {
        model = SetGameVM.createGame()
    }
    
    static func createGame() -> SetGame{
        return SetGame()
    }
    
    var cards: Array<SetGame.Card> {
        model.deck
    }
}
