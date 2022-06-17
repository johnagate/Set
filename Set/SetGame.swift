//
//  SetGame.swift
//  Set
//
//  Created by john agate on 6/16/22.
//

import Foundation

struct SetGame {
    // private(set)
    var cards: Array<Card>
    
    init() {
        cards = Array<Card>()
        for i in 1...81 {
            cards.append(Card(id: i))
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var isMatched: Bool = false
        var isSelected: Bool = false
        var color: String = ""
        var suit: String = ""
    }
}
