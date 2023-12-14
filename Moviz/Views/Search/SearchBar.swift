//
//  SearchBar.swift
//  Moviz
//
//  Created by charlene hoareau on 13/12/2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .padding(.leading, 8)
            TextField(placeholder, text: $text)
                .padding(8)
                .background(Color.tabBarBackground)
                .cornerRadius(8)
                //.padding(.trailing, 8)
                .keyboardType(.alphabet)
                .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.tabBarBorder, lineWidth: 2))              .foregroundColor(.white)
                .accentColor(.white)
                .opacity(text.isEmpty ? 0.8 : 1.0)
                

            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                }
                .padding(.trailing, 8)
            }
        }
        .padding(.horizontal)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""), placeholder: "Search")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
