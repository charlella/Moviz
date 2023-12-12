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
    var network: Network?
    
    var premiered: String
    var ended: String?
    var officialSite: String?
    var runtime: Int?
    var averageRuntime: Int
    var status: String

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
    struct Network: Codable, Hashable {
           var id: Int
           var name: String
           var country: Country
           var officialSite: String?

           struct Country: Codable, Hashable {
               var name: String
               var code: String
               var timezone: String
           }
       }
}
