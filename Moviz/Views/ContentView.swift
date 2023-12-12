//
//  ContentView.swift
//  Moviz
//
//  Created by charlene hoareau on 11/12/2023.
//

import SwiftUI

struct ContentView: View {
    var movies: [Movie]

    var body: some View {
//           NavigationView {
               NavigationSplitView {
                   List(movies) { movie in
                       NavigationLink {
                           MovieDetail(movie: movie)
                       } label: {
                           MovieRow(movie: movie)
                       }
                   }
                   .navigationTitle("Movies")
               } detail: {
                   Text("Select a Movie")
               }
//           }
       }
   }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let movies = ModelData().movies
        return ContentView(movies: movies)
    }
}

