//
//  CardView.swift
//  Set
//
//  Created by john agate on 6/18/22.
//

import SwiftUI

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
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let cardShape = RoundedRectangle(cornerRadius: geometry.size.height * 0.15)
                cardShape.fill().foregroundColor(.white)
                cardShape.strokeBorder(lineWidth: geometry.size.height * 0.02)
                VStack {
                    ForEach(1...card.numShapes, id: \.self) { _ in
                        ZStack {
                            RoundedRectangle(cornerRadius: geometry.size.height * 0.075)
                                .strokeBorder(lineWidth:  geometry.size.height * 0.02)
                                .padding(.horizontal, 0)
                                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.15)
                                .aspectRatio(2/1, contentMode: .fit)
                                .foregroundColor(fontColor)
                            RoundedRectangle(cornerRadius: geometry.size.height * 0.075)
                                .padding(.horizontal, 0)
                                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.15)
                                .aspectRatio(2/1, contentMode: .fit)
                                .foregroundColor(fontColor)
                                .opacity(opacity)
                        }
                    }
                }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            }
        }
        
    }
}
