//
//  ContentView.swift
//  Moviz
//
//  Created by charlene hoareau on 11/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            /*Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)*/
            Text("Under the Dome")
                .font(.title)
            HStack {
                Text("Drama, Science-Fiction, Thriller")
                    .font(.subheadline)
                Spacer()
                Text("CBS")
                    .font(.subheadline)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
