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
        var i: Int = 1
        for color in Color.allCases {
            for shape in Shape.allCases {
                for opacity in Opacity.allCases {
                    for numShapes in 1...3 {
                        cards.append(Card(id: i, color: color, shape: shape, opacity: opacity, numShapes: numShapes))
                        i += 1
                    }
                }
            }
        }
        cards = cards.shuffled()
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
        case black, silver, red
    }
    
    enum Shape: CaseIterable {
        case diamond, rectangle, oval
    }
    
    enum Opacity: CaseIterable {
        case clear, opaque, solid
    }
    
}
