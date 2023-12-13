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
                        .foregroundColor(.secondary)
                        .padding()
                    Spacer()
                }
            }
            .navigationTitle("Search")
        }
    }
    
    private func updateSearchResults() {
        dataManager.fetchMovies { _ in
            let filteredMovies = dataManager.movies.filter { movie in
                let lowercasedName = movie.name.lowercased()
                let lowercasedSearchText = searchText.lowercased()
                
                return containsExactOrder(substring: lowercasedSearchText, in: lowercasedName)
            }
            
            dataManager.searchResults = filteredMovies
        }
    }
    
    private func containsExactOrder(substring: String, in text: String) -> Bool {
        var substringIndex = substring.startIndex
        
        for char in text {
            guard substringIndex < substring.endIndex else {
                return true
            }
            
            if char == substring[substringIndex] {
                substringIndex = substring.index(after: substringIndex)
            }
        }
                return substringIndex == substring.endIndex
    }
}

struct SearchHome_Previews: PreviewProvider {
    static var previews: some View {
        SearchHome()
            .environmentObject(DataManager())
    }
}
