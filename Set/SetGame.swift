//
//  SetGame.swift
//  Set
//
//  Created by john agate on 6/16/22.
//

import Foundation

struct SetGame {
    // private(set)
    private(set) var deck: Array<Card>
    private(set) var deltCards: Array<Card>
    
    init() {
        deck = Array<Card>()
        var i: Int = 1
        for color in Color.allCases {
            for shape in Shape.allCases {
                for opacity in Opacity.allCases {
                    for numShapes in 1...3 {
                        deck.append(Card(id: i, color: color, shape: shape, opacity: opacity, numShapes: numShapes))
                        i += 1
                    }
                }
            }
        }
        deck = deck.shuffled()
        deltCards = Array(deck[0...11])
        deck = Array(deck[12...81])
    }
    
    struct Card: Identifiable {
        var id: Int
        var isMatched: Bool = false
        var isSelected: Bool = false
        var color: Color
        var shape: Shape
        var opacity: Opacity
        var numShapes: Int
    }
    
    enum Color: CaseIterable {
        case purple, green, red
    }
    
    enum Shape: CaseIterable {
        case diamond, rectangle, oval
    }
    
    enum Opacity: CaseIterable {
        case clear, opaque, solid
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = deltCards.firstIndex(where: {$0.id == card.id}),
           !deltCards[chosenIndex].isSelected,
           !deltCards[chosenIndex].isMatched
        {
            deltCards[chosenIndex].isSelected = true
        }
    }
    
    mutating func newGame() {
        deck = Array<Card>()
        var i: Int = 1
        for color in Color.allCases {
            for shape in Shape.allCases {
                for opacity in Opacity.allCases {
                    for numShapes in 1...3 {
                        deck.append(Card(id: i, color: color, shape: shape, opacity: opacity, numShapes: numShapes))
                        i += 1
                    }
                }
            }
        }
        deck = deck.shuffled()
        deltCards = Array(deck[0...11])
        deck = Array(deck[12...81])
    }
    
}
