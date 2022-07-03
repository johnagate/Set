//
//  SetGame.swift
//  Set
//
//  Created by john agate on 6/16/22.
//

import Foundation

struct SetGame {
    private(set) var deck: Array<Card>
    private(set) var deltCards: Array<Card>
    private var indecesOfSelectedCards: Array<Int> = []
    private var indecesOfMatchedCards: Array<Int> = []
    
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
        deck = Array(deck[12...80])
    }
    
    struct Card: Identifiable, Equatable {
        var id: Int
        var isMatched: Bool = false
        var isSelected: Bool = false
        var isNotMatched: Bool = false
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
            if indecesOfSelectedCards.count < 2 {
                deltCards[chosenIndex].isSelected = true
                indecesOfSelectedCards.append(chosenIndex)
            } else if indecesOfSelectedCards.count < 3 {
                deltCards[chosenIndex].isSelected = true
                indecesOfSelectedCards.append(chosenIndex)
                // matching logic
                if
                    ((deltCards[indecesOfSelectedCards[0]].color == deltCards[indecesOfSelectedCards[1]].color &&
                        deltCards[indecesOfSelectedCards[1]].color == deltCards[indecesOfSelectedCards[2]].color)
                        || (deltCards[indecesOfSelectedCards[0]].color != deltCards[indecesOfSelectedCards[1]].color
                            && deltCards[indecesOfSelectedCards[1]].color != deltCards[indecesOfSelectedCards[2]].color
                            && deltCards[indecesOfSelectedCards[0]].color != deltCards[indecesOfSelectedCards[2]].color))
                    && ((deltCards[indecesOfSelectedCards[0]].shape == deltCards[indecesOfSelectedCards[1]].shape &&
                        deltCards[indecesOfSelectedCards[1]].shape == deltCards[indecesOfSelectedCards[2]].shape)
                        || (deltCards[indecesOfSelectedCards[0]].shape != deltCards[indecesOfSelectedCards[1]].shape
                            && deltCards[indecesOfSelectedCards[1]].shape != deltCards[indecesOfSelectedCards[2]].shape
                            && deltCards[indecesOfSelectedCards[0]].shape != deltCards[indecesOfSelectedCards[2]].shape))
                    && ((deltCards[indecesOfSelectedCards[0]].opacity == deltCards[indecesOfSelectedCards[1]].opacity &&
                        deltCards[indecesOfSelectedCards[1]].opacity == deltCards[indecesOfSelectedCards[2]].opacity)
                        || (deltCards[indecesOfSelectedCards[0]].opacity != deltCards[indecesOfSelectedCards[1]].opacity
                            && deltCards[indecesOfSelectedCards[1]].opacity != deltCards[indecesOfSelectedCards[2]].opacity
                            && deltCards[indecesOfSelectedCards[0]].opacity != deltCards[indecesOfSelectedCards[2]].opacity))
                    && ((deltCards[indecesOfSelectedCards[0]].numShapes == deltCards[indecesOfSelectedCards[1]].numShapes &&
                        deltCards[indecesOfSelectedCards[1]].numShapes == deltCards[indecesOfSelectedCards[2]].numShapes)
                        || (deltCards[indecesOfSelectedCards[0]].numShapes != deltCards[indecesOfSelectedCards[1]].numShapes
                            && deltCards[indecesOfSelectedCards[1]].numShapes != deltCards[indecesOfSelectedCards[2]].numShapes
                            && deltCards[indecesOfSelectedCards[0]].numShapes != deltCards[indecesOfSelectedCards[2]].numShapes))
                {
                    deltCards[indecesOfSelectedCards[0]].isMatched = true
                    deltCards[indecesOfSelectedCards[1]].isMatched = true
                    deltCards[indecesOfSelectedCards[2]].isMatched = true
                    indecesOfMatchedCards = indecesOfSelectedCards
                }
            } else {
                // logic for replacing cards if match on board
                for i in indecesOfSelectedCards {
                    deltCards[i].isSelected = false
                }
                indecesOfSelectedCards = []
                deltCards[chosenIndex].isSelected = true
                if indecesOfMatchedCards.count == 3 {
                    if deltCards.count > 12 || deck.count == 0 {
                        deltCards = deltCards.filter {!$0.isMatched}
                    } else {
                        if deck.count > 3 {
                            deltCards[indecesOfMatchedCards[0]] = deck[0]
                            deltCards[indecesOfMatchedCards[1]] = deck[1]
                            deltCards[indecesOfMatchedCards[2]] = deck[2]
                            deck = Array(deck[3...deck.count - 1])
                        } else if deck.count > 2 {
                            deltCards[indecesOfMatchedCards[0]] = deck[0]
                            deltCards[indecesOfMatchedCards[1]] = deck[1]
                            deltCards[indecesOfMatchedCards[2]] = deck[2]
                            deck = []
                        }
                    }
                    indecesOfMatchedCards = []
                }
                // correct the selected card indexes for removal
                indecesOfSelectedCards.append(deltCards.firstIndex(where: {$0.isSelected})!)
            }
            
        } else if let chosenIndex = deltCards.firstIndex(where: {$0.id == card.id}),
            !deltCards[chosenIndex].isMatched,
            deltCards[chosenIndex].isSelected
        {
            deltCards[chosenIndex].isSelected = false
            indecesOfSelectedCards = indecesOfSelectedCards.filter { $0 != chosenIndex}
        }
        print(indecesOfSelectedCards)
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
        deck = Array(deck[12...80])
    }
    
    mutating func dealThree() {
        if indecesOfMatchedCards.count == 3 {
            if deck.count > 3 {
                deltCards[indecesOfMatchedCards[0]] = deck[0]
                deltCards[indecesOfMatchedCards[1]] = deck[1]
                deltCards[indecesOfMatchedCards[2]] = deck[2]
                deck = Array(deck[3...deck.count - 1])
            } else if deck.count > 2 {
                deltCards[indecesOfMatchedCards[0]] = deck[0]
                deltCards[indecesOfMatchedCards[1]] = deck[1]
                deltCards[indecesOfMatchedCards[2]] = deck[2]
                deck = []
            }
            indecesOfMatchedCards = []
        } else {
            if deck.count > 3 {
                deltCards = deltCards + Array(deck[0...2])
                deck = Array(deck[3...deck.count - 1])
            } else if deck.count > 2 {
                deltCards = deltCards + Array(deck[0...2])
                deck = []
            }
        }
    }
    
}
