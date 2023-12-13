//
//  CategoryHome.swift
//  Moviz
//
//  Created by charlene hoareau on 13/12/2023.
//

import SwiftUI
import URLImage

struct CategoryHome: View {
    @EnvironmentObject var dataManager: DataManager
    //Ajouter le profil de l'utilisateur
    
    var body: some View {
        NavigationSplitView {
            // Affichage de l'image du prochain film
            if let nextMovie = dataManager.movies.first {
                URLImage(URL(string: nextMovie.image.original)!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                        .clipped()
                        .listRowInsets(EdgeInsets())
                }
                .padding(.bottom, 20)
            }
            
            // Liste des genres de films
            List {
                ForEach(dataManager.genres.keys.sorted(), id: \.self) { key in
                    if let moviesForCategory = dataManager.genres[key] {
                        let moviesForCategoryWithGenres = moviesForCategory.filter { !$0.genres.isEmpty }
                        if !moviesForCategoryWithGenres.isEmpty {
                            NavigationLink(destination: CategoryRow(categoryName: key, items: moviesForCategoryWithGenres)) {
                                CategoryRow(categoryName: key, items: moviesForCategoryWithGenres)
                            }
                            .listRowInsets(EdgeInsets())
                        }
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle("Home")
        } detail: {
            Text("Select a Movie")
        }
        .onAppear {
            loadData()
        }
    }
    
    
    private func loadData() {
        dataManager.fetchMovies { _ in
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryHome()
//            .environmentObject(DataManager())
//    }
    static var previews: some View {
        let movies = ModelData().movies
        let dataManager = DataManager()
        dataManager.movies = movies
        dataManager.genres = Dictionary(grouping: movies, by: { $0.genres.first ?? "" })

        return CategoryHome()
            .environmentObject(dataManager)
    }
}
