//
//  Diamond.swift
//  Set
//
//  Created by john agate on 6/18/22.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        
        let topMid = CGPoint(x: rect.midX, y: rect.maxY)
        let leftMid = CGPoint(x: rect.minX, y: rect.midY)
        let bottomMid = CGPoint(x: rect.midX, y: rect.minY)
        let rightMid = CGPoint(x: rect.maxX, y: rect.midY)
        
        var p = Path()
        p.move(to: topMid)
        p.addLine(to: leftMid)
        p.addLine(to: bottomMid)
        p.addLine(to: rightMid)
        p.addLine(to: topMid)
        
        return p
    }
}
