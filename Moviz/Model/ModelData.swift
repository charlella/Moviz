//
//  ModelData.swift
//  Moviz
//
//  Created by charlene hoareau on 11/12/2023.
//

import Foundation

class ModelData: ObservableObject {
    @Published var movies: [Movie] = load("movizData.json")
    @Published var profile = Profile.default

}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        print("Error decoding \(filename): \(error)")
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
