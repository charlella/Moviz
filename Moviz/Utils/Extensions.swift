//
//  Extensions.swift
//  Moviz
//
//  Created by charlene hoareau on 14/12/2023.
//

import SwiftUI

extension Color {
    static let background = LinearGradient(gradient: Gradient(colors: [Color("Background 1"), Color("Background 2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
    static let navBarBackground = LinearGradient(gradient: Gradient(colors: [Color("Background 1").opacity(0.1), Color("Background 2").opacity(0.1)]), startPoint: .topLeading, endPoint: .bottomTrailing)
    static let tabBarBackground = LinearGradient(gradient: Gradient(colors: [Color("Tab Bar Background 1").opacity(0.26), Color("Tab Bar Background 2").opacity(0.26)]), startPoint: .top, endPoint: .bottom)
    static let movieCardBorder = LinearGradient(gradient: Gradient(colors: [Color("Movie Fav Background 1"), Color("Movie Other Background 2")]), startPoint: .leading, endPoint: .trailing)
    static let tabBarBorder = Color("Tab Bar Border").opacity(0.5)
}
