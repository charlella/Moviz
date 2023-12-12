//
//  ContentView.swift
//  Moviz
//
//  Created by charlene hoareau on 11/12/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataManager: DataManager

    var body: some View {
        NavigationSplitView {
             List(dataManager.movies) { movie in
                 NavigationLink(
                     destination: MovieDetail(movie: movie),
                     label: {
                         MovieRow(movie: movie)
                     }
                 )
             }
             .navigationTitle("Movies")
         } detail: {
             Text("Select a Movie")
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

