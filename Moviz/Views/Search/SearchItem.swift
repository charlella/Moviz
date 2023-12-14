//
//  SearchItem.swift
//  Moviz
//
//  Created by charlene hoareau on 13/12/2023.
//

import SwiftUI
import URLImage

struct SearchItem: View {
    @EnvironmentObject var dataManager: DataManager
    var movie: Movie
    
    var body: some View {
        VStack(alignment: .center) {
            URLImage(URL(string: movie.image.medium)!) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .cornerRadius(10)
            }
                    Text(movie.name)
                        .foregroundStyle(.primary)
                        .font(.title3)
                        .foregroundColor(.primary)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .clipped()
            //Ajuster le titre pour un retour à la ligne si > à la largeur de l'image
                }
                .padding(.leading, 15)
    }
}


struct SearchItem_Previews: PreviewProvider {
    static var previews: some View {
        let dataManager = DataManager()
        dataManager.movies = ModelData().movies
        return SearchItem(movie: dataManager.movies[0])
            .environmentObject(DataManager())
            .preferredColorScheme(.dark)

    }
}
