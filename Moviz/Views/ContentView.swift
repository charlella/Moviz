import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var showFavoritesOnly = false

    var body: some View {
        NavigationSplitView {
            Toggle("Show Favorites Only", isOn: $showFavoritesOnly)
                .padding()
            List {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataManager())
    }
}
