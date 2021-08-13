//
//  CityWeather.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import Foundation

struct CityWeather: Codable {
    var id: Int? = 0
    var name: String? = ""
    var sunset: Int? = 0
    var sunrise: Int? = 0
    
    enum CodingKeys: String, CodingKey {
        case id, name, sunset, sunrise
    }
}

