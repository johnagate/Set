//
//  CardView.swift
//  Set
//
//  Created by john agate on 6/18/22.
//

import SwiftUI

struct CardView: View {
    let card: SetGame.Card
    
    var shape: SetGame.Shape {
        return card.shape
    }
    
    var shapeColor: Color {
        switch card.color {
        case .red:
            return .red
        case .purple:
            return .purple
        case .green:
            return .green
        }
    }
    
    var opacity: CGFloat {
        switch card.opacity {
        case .clear:
            return 0
        case .opaque:
            return 0.25
        case .solid:
            return 1
        }
    }
    
    var strokeColor: Color {
        if card.isMatched {
            return .black
        } else if card.isNotMatched {
            return .red
        } else if card.isSelected {
            return .blue
        } else {
            return .gray
        }
    }

    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let cardShape = RoundedRectangle(cornerRadius: geometry.size.height * 0.15)
                cardShape.fill().foregroundColor(.white)
                cardShape.stroke(strokeColor, lineWidth: geometry.size.height * 0.02)
                
                
                VStack {
                    ForEach(1...card.numShapes, id: \.self) { _ in
                        ZStack {
                            ShapeView(shape: shape, opacity: opacity)
                        }
                        .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.15)
                        .aspectRatio(2/1, contentMode: .fit)
                        .foregroundColor(shapeColor)
                    }
                }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            }
        }
    }
}
