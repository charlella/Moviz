//
//  MovieList.swift
//  Moviz
//
//  Created by charlene hoareau on 12/12/2023.
//

import SwiftUI

struct MovieList: View {
    var movies: [Movie]

    var body: some View {
        ForEach(movies) { movie in
            MovieRow(movie: movie)
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
           let movies = ModelData().movies
           return List(movies) { movie in
               MovieRow(movie: movie)
           }
       }
   }
