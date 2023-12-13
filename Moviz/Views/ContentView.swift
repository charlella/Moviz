import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var selection: Tab = .home

    enum Tab {
            case home
            case search
            case list
        }
    
    var body: some View {
        TabView(selection: $selection) {
                    NavigationView {
                        CategoryHome()
                    }
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(Tab.home)

                    NavigationView {
                        SearchHome()
                    }
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                    .tag(Tab.search)

                    MovieList()
                        .tabItem {
                            Label("List", systemImage: "list.bullet")
                        }
                        .tag(Tab.list)
                }
                .onAppear {
                    loadData()
                }
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
