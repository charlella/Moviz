//
//  rectangleImage.swift
//  Moviz
//
//  Created by charlene hoareau on 11/12/2023.
//

import SwiftUI

struct rectangleImage: View {
    var body: some View {
        Image("underTheDome")
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .overlay(
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(Color.white, lineWidth: 4)
                )
            .shadow(radius: 7)
    }
}

struct rectangleImage_Previews: PreviewProvider {
    static var previews: some View {
        rectangleImage()
    }
}
