//
//  ShapeView.swift
//  Set
//
//  Created by john agate on 6/18/22.
//

import SwiftUI

struct ShapeView: View {
    let shape: SetGame.Shape
    let opacity: CGFloat
    
    var body: some View {
        switch shape {
        case .diamond:
            return AnyView(
                ZStack {
                    Diamond().stroke(lineWidth: 3)
                    Diamond().opacity(opacity)
                }
            )
        case .oval:
            return AnyView(
                ZStack {
                    RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 3)
                    RoundedRectangle(cornerRadius: 20).opacity(opacity)
                }
            )
        case .rectangle:
            return AnyView(
                ZStack {
                    Rectangle().stroke(lineWidth: 3)
                    Rectangle().opacity(opacity)
                }
            )
        }
    }
}
