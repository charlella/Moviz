//
//  MovizApp.swift
//  Moviz
//
//  Created by charlene hoareau on 11/12/2023.
//

import SwiftUI

@main
struct MovizApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView(movies: modelData.movies)
                .environmentObject(modelData)
        }
    }
}
