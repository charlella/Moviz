//
//  rectangleImage.swift
//  Moviz
//
//  Created by charlene hoareau on 11/12/2023.
//

import SwiftUI

struct RectangleImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .overlay(
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(Color.movieCardBorder, lineWidth: 4)
            )
            .shadow(radius: 7)
    }
}

extension View {
    func rectangleImageStyle() -> some View {
        self.modifier(RectangleImage())
    }
}
