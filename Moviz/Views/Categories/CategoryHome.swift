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
    @State private var showingProfile = false
    
    var body: some View {
        NavigationSplitView {
            ScrollView {
                if let firstMovie = dataManager.movies.first {
                    URLImage(URL(string: firstMovie.image.original)!) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 300)
                            .clipped()
                            .listRowInsets(EdgeInsets())
                    }
                    .padding(.bottom, 2)
                    .rectangleImageStyle()
                }
                
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
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                        .font(.title)
                        .foregroundColor(Color("Tab Bar Border"))
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(dataManager)
                    .preferredColorScheme(.dark)
            }
            .background(Color.background)
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
    static var previews: some View {
        let movies = ModelData().movies
        let dataManager = DataManager()
        dataManager.movies = movies
        dataManager.genres = Dictionary(grouping: movies, by: { $0.genres.first ?? "" })

        return CategoryHome()
            .environmentObject(dataManager)
            .preferredColorScheme(.dark)
    }
}
