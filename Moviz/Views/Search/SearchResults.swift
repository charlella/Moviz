//
//  SearchResults.swift
//  Moviz
//
//  Created by charlene hoareau on 13/12/2023.
//

import SwiftUI
import URLImage

struct SearchResults: View {
    @EnvironmentObject var dataManager: DataManager

        var body: some View {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], alignment: .center) {
                    ForEach(dataManager.movies, id: \.id) { movie in
                        NavigationLink(destination: MovieDetail(movie: movie)) {
                            SearchItem(movie: movie)
                                .padding(.vertical, 2)
                        }
                    }
                }
                .padding(.horizontal)
                Spacer()
                
            }
            .navigationTitle("Search Results")
        }
    }

    struct SearchResults_Previews: PreviewProvider {
        static var previews: some View {
            let movies = ModelData().movies
            let dataManager = DataManager()
            dataManager.movies = movies

            return SearchResults()
                .environmentObject(dataManager)
        }
//        static var previews: some View {
//            SearchResults()
//                .environmentObject(DataManager())
//        }
    }
