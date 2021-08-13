//
//  WeatherList.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import Foundation

struct WeatherList: Codable {
    var mainDetails: MainDetails? = nil
    var weatherDetails: [WeatherDetails]? = nil
    
    enum CodingKeys: String, CodingKey {
        case mainDetails = "main"
        case weatherDetails = "weather"
    }
}


