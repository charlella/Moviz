//
//  MovieDetail.swift
//  Moviz
//
//  Created by charlene hoareau on 12/12/2023.
//

import SwiftUI
import URLImage

struct MovieDetail: View {
    @EnvironmentObject var dataManager: DataManager
    var movie: Movie
    
    var body: some View {
        VStack {
            URLImage(URL(string: movie.image.medium)!) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
            }
            .rectangleImageStyle()
            VStack(alignment: .leading) {
                HStack {
                    Text(movie.name)
                        .font(.title)
                        .fontWeight(.bold)
                Image(systemName: dataManager.isFavorite(movie: movie) ? "star.fill" : "star")
                        .foregroundColor(dataManager.isFavorite(movie: movie) ? .yellow : .gray)
                        .padding(.trailing, 10)
                        .font(.title)
                }
                HStack {
                    Text(movie.genres.joined(separator: ", "))
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Spacer()
                    if let rating = movie.rating.average {
                        Text(String(format: "Rating: %.1f", rating))
                                .font(.subheadline)
                                .fontWeight(.bold)
                                        }
                }
                
                HStack {
                    Text("\(movie.schedule.days.joined(separator: ", ")) (\(movie.schedule.time))")
                    Spacer()
                    Text(movie.network?.name ?? "")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)

                Divider()
                
                Text("About \(movie.name)")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text(movie.summary)
                    .font(.body)
            }
            .padding()
        }
        .onTapGesture {
                  dataManager.toggleFavorite(movie: movie)
              }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        let dataManager = DataManager()
        dataManager.movies = ModelData().movies
        return MovieDetail(movie: dataManager.movies[0])
            .environmentObject(DataManager())
    }
}
