//
//  MovizApp.swift
//  Moviz
//
//  Created by charlene hoareau on 11/12/2023.
//

import SwiftUI

@main
struct MovizApp: App {
    @StateObject private var dataManager = DataManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataManager)
                .onAppear {
                    dataManager.fetchMovies { _ in }
                }
        }
    }
}
