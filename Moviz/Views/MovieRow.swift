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
                               .frame(width: 100, height: 100)
                       }
            VStack(alignment: .leading)  {
                Text(movie.name)
                    .font(.title3.bold())
                Text(movie.genres.joined())
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            
        }
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
           let movies = ModelData().movies
           return List(movies) { movie in
               MovieRow(movie: movie)
           }
       }
   }
