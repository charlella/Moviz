//
//  CategoryRow.swift
//  Moviz
//
//  Created by charlene hoareau on 13/12/2023.
//

import SwiftUI
import URLImage

struct CategoryRow: View {
    @EnvironmentObject var dataManager: DataManager
    var categoryName: String
    var items: [Movie]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.title)
                .foregroundColor(.primary)
                .padding(.leading, 15)
                .padding(.bottom, 5)
                .padding(.top, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { movie in
                        NavigationLink {
                            MovieDetail(movie: movie)
                        } label: {
                            CategoryItem(movie: movie)
                        }
                    }
                }
            }
            .frame(height: 250)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        let movies = ModelData().movies
        let dataManager = DataManager()
        dataManager.movies = movies

        return CategoryRow(
            categoryName: movies[0].genres[0],
            items: movies
        )
        .environmentObject(dataManager)
    }
}
// Row static avec ModelData
//    static var previews: some View {
//        let movies = ModelData().movies
//        return CategoryRow(
//            categoryName: movies[0].genres.first ?? "",
//            items: movies
//            //Pour afficher 4 films
//            //items: Array(movies.prefix(4))
//        )
//        .environmentObject(DataManager())
//    }
//}
