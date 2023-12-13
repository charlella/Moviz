//
//  DataManager.swift
//  Moviz
//
//  Created by charlene hoareau on 12/12/2023.
//

import Foundation

class DataManager: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var favoriteMovieIDs: Set<Int> = []
    @Published var genres: [String: [Movie]] = [:]
    @Published var searchResults: [Movie] = []
    @Published var profile = Profile.default

    func toggleFavorite(movie: Movie) {
            if favoriteMovieIDs.contains(movie.id) {
                favoriteMovieIDs.remove(movie.id)
            } else {
                favoriteMovieIDs.insert(movie.id)
            }
        }
    
    func isFavorite(movie: Movie) -> Bool {
           return favoriteMovieIDs.contains(movie.id)
       }
    
    var favoriteMovies: [Movie] {
            return movies.filter { favoriteMovieIDs.contains($0.id) }
        }
    
    func fetchMovies(completion: @escaping ([Movie]?) -> Void) {
        guard let url = URL(string: "https://api.tvmaze.com/shows") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Error fetching data:", error?.localizedDescription ?? "Unknown error")
                completion(nil)
                return
            }

            do {
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                DispatchQueue.main.async {
                    self.movies = movies
                    self.genres = Dictionary(grouping: movies, by: { $0.genres.first ?? "" })
                    print("Movies loaded successfully:", movies)
                    completion(movies)
                }
            } catch {
                print("Erreur de décodage : \(error)")
                completion(nil)
            }
        }.resume()
    }
}
