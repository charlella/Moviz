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
        VStack(spacing: 0) {
            TabView(selection: $selection) {
                            CategoryHome()
                                .environmentObject(dataManager)
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                        .tag(Tab.home)

                            SearchHome()
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
                    .accentColor(Color("Rating Text"))
                    .onAppear {
                        loadData()
                    }
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
            .preferredColorScheme(.dark)
    }
}
