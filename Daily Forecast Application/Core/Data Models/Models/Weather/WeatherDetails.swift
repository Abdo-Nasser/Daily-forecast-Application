//
//  WeatherDetails.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import Foundation

struct WeatherDetails: Codable {
    var id: Int? = 0
    var state: String? = ""
    var description: String? = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case state = "main"
        case description = "description"
    }
}
