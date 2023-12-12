//
//  Movie.swift
//  Moviz
//
//  Created by charlene hoareau on 11/12/2023.
//

import Foundation
import SwiftUI

struct Movie: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var genres: [String]
    var schedule: Schedule
    var rating: Rating
    var summary: String
    var image: ImageURL

    struct Schedule: Codable, Hashable {
        var time: String
        var days: [String]
    }

    struct Rating: Codable, Hashable {
        var average: Double?
    }

    struct ImageURL: Codable, Hashable {
        var medium: String
        var original: String
    }
}
