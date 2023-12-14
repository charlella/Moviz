//
//  SearchHome.swift
//  Moviz
//
//  Created by charlene hoareau on 13/12/2023.
//

import SwiftUI
import URLImage

struct SearchHome: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, placeholder: "Search movies")
                    .padding()
                    .onChange(of: searchText) { _ in
                        updateSearchResults()
                    }
                
                if !searchText.isEmpty {
                    SearchResults()
                } else {
                    Text("Enter a search term")
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
            }
            .navigationTitle("Search")
            .background(Color.background)
        }
    }
    
    private func updateSearchResults() {
        dataManager.fetchMovies { _ in
            let filteredMovies = dataManager.movies.filter { movie in
                let lowercasedName = movie.name.lowercased()
                let lowercasedSearchText = searchText.lowercased()
                
                return containsSearchText(lowercasedSearchText, in: lowercasedName)
            }
            
            dataManager.searchResults = filteredMovies
        }
    }
    
    private func containsSearchText(_ searchText: String, in movieName: String) -> Bool {
        return movieName.lowercased().contains(searchText.lowercased())
    }
}

struct SearchHome_Previews: PreviewProvider {
    static var previews: some View {
        SearchHome()
            .environmentObject(DataManager())
            .preferredColorScheme(.dark)

    }
}
