//
//  MovieRow.swift
//  Moviz
//
//  Created by charlene hoareau on 11/12/2023.
//

import SwiftUI
import URLImage

struct MovieRow: View {
    @EnvironmentObject var dataManager: DataManager
        var movie: Movie

        var body: some View {
            VStack {
                HStack {
                    URLImage(URL(string: movie.image.medium)!) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 95, height: 130)
                            .clipShape(RoundedRectangle(cornerRadius: 20.0))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20.0)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            .shadow(color: .purple, radius: 2)
                    }
                    .padding(.trailing)
                    VStack(alignment: .leading)  {
                        HStack {
                            Text(movie.name)
                                .font(.title3.bold())
                            if dataManager.isFavorite(movie: movie) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .padding(.trailing, 10)
                                           }
                        }
                        Text(movie.genres.joined(separator: ", "))
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                }
                .background(Color.background)
            }
        }
    }

    struct MovieRow_Previews: PreviewProvider {
        static var previews: some View {
            let dataManager = DataManager()
            dataManager.movies = ModelData().movies

            return Group {
                MovieRow(movie: dataManager.movies[0])
                    .environmentObject(DataManager())
                    .preferredColorScheme(.dark)
            }
        }
    }
