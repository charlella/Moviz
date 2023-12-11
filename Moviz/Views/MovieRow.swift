//
//  MovieRow.swift
//  Moviz
//
//  Created by charlene hoareau on 11/12/2023.
//

import SwiftUI
import URLImage

struct MovieRow: View {
    var movie: Movie
    
    var body: some View {
        HStack {
            URLImage(URL(string: movie.image.medium)!) { image in
                           image
                               .resizable()
                               .aspectRatio(contentMode: .fit)
                               .frame(width: 50, height: 50)
                       }
            Text(movie.name)
            
            Spacer()
            
        }
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        let movies = ModelData().movies
        return Group {
            MovieRow(movie: movies[0])
            MovieRow(movie: movies[1])
        }
    }
}
