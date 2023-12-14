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
                    ForEach(dataManager.searchResults, id: \.id) { movie in
                    NavigationLink(destination: MovieDetail(movie: movie)) {
                        SearchItem(movie: movie)
                            .padding(.top, 12)
                            .padding(.bottom, 12)
                        }
                    }
                }
                .padding(.trailing, 15)
                //Spacer()
                
            }
            .navigationTitle("Search")
        }
    }

    struct SearchResults_Previews: PreviewProvider {
        static var previews: some View {
            let movies = ModelData().movies
            let dataManager = DataManager()
            dataManager.movies = movies

            return SearchResults()
                .environmentObject(dataManager)
                .preferredColorScheme(.dark)

        }
//        static var previews: some View {
//            SearchResults()
//                .environmentObject(DataManager())
//        }
    }
