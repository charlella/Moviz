//
//  MovieList.swift
//  Moviz
//
//  Created by charlene hoareau on 12/12/2023.
//

import SwiftUI

struct MovieList: View {
@EnvironmentObject var dataManager: DataManager
@State private var showFavoritesOnly = false

var body: some View {
    NavigationSplitView {
        List {
            Toggle("Show Favorites Only", isOn: $showFavoritesOnly)
                .padding()
            ForEach(filteredMovies) { movie in
                NavigationLink(
                    destination: MovieDetail(movie: movie),
                    label: {
                        MovieRow(movie: movie)
                    }
                )
            }
        }
        .navigationTitle("Movies")
    } detail: {
        Text("Select a Movie")
    }
    .onAppear {
        loadData()
    }
}

private var filteredMovies: [Movie] {
    return showFavoritesOnly ? dataManager.favoriteMovies : dataManager.movies
}

private func loadData() {
    dataManager.fetchMovies { _ in }
}
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
            .environmentObject(DataManager())
    }
}

