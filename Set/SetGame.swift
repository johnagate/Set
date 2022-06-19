//
//  SetGame.swift
//  Set
//
//  Created by john agate on 6/16/22.
//

import Foundation

struct SetGame {
    // private(set)
    var deck: Array<Card>
    
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
        deck = Array(deck[0...11])
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
    
}
