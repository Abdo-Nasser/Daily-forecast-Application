//
//  Weather.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import Foundation
import RealmSwift

struct Weather : Codable {
    var statusCode: String? = ""
    var city: CityWeather? = nil
    var weatherList: [WeatherList]? = nil
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "cod"
        case city = "city"
        case weatherList = "list"
    }
}
