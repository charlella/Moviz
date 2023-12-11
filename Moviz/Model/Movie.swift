//
//  Movie.swift
//  Moviz
//
//  Created by charlene hoareau on 11/12/2023.
//

import Foundation
import SwiftUI

struct Movie: Hashable, Codable {
    var id: Int
    var name: String
    var genres: [String]
    var schedule: Schedule
    var rating: Rating
    var summary: String

    struct Schedule: Codable, Hashable {
        var time: String
        var days: [String]
    }

    struct Rating: Codable, Hashable {
        var average: Double
    }

    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
