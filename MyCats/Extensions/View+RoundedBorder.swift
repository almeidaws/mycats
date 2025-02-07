//
//  View+RoundedBorder.swift
//  MyCats
//
//  Created by Alma Viva on 06/02/25.
//

import SwiftUI

struct RoundedBorderViewModifier: ViewModifier {
    
    let cornerRadius: CGFloat
    let style: any ShapeStyle
    let lineWidth: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.gray, lineWidth: 1))
    }
}

extension View {
    func roundedBorder(cornerRadius: CGFloat, style: any ShapeStyle, lineWidth: CGFloat) -> some View {
        modifier(RoundedBorderViewModifier(cornerRadius: cornerRadius, style: style, lineWidth: lineWidth))
    }
}
