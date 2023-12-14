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
        VStack(spacing: 0) {
            Toggle("Show Favorites Only", isOn: $showFavoritesOnly)
                .padding()
                .toggleStyle(SwitchToggleStyle(tint: .purple))
                .zIndex(1)
                .background(Color.background)

            VStack {
                if filteredMovies.isEmpty {
                    Spacer()
                    Text("No Favorite Movie")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                    Spacer()
                } else {
                    List {
                        ForEach(filteredMovies) { movie in
                            NavigationLink(
                                destination: MovieDetail(movie: movie),
                                label: {
                                    MovieRow(movie: movie)
                                }
                            )
                            .listRowBackground(Color.background)
                            .listRowSeparatorTint(Color.white)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .background(Color.background)
            .navigationTitle("Movies")
        }
    }
    detail: {
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
            .preferredColorScheme(.dark)
    }
}

