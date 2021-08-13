//
//  Weather.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import Foundation

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

struct CityWeather: Codable {
    var id: Int? = 0
    var name: String? = ""
    var sunset: Int? = 0
    var sunrise: Int? = 0
    
    enum CodingKeys: String, CodingKey {
        case id, name, sunset, sunrise
    }
}

struct WeatherList: Codable {
    var mainDetails: MainDetails? = nil
    var weatherDetails: [WeatherDetails]? = nil 
    
    enum CodingKeys: String, CodingKey {
        case mainDetails = "main"
        case weatherDetails = "weather"
    }
}

struct MainDetails: Codable {
    var temp: Double = 0
    var pressure: Double = 0
    var humidity: Double = 0
    
    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
    }
}

struct WeatherDetails: Codable {
    var id: Int? = 0
    var state: String? = ""
    var description: String? = ""
    
    enum CodingKeys: String, CodingKey {
        case id, state, description
    }
}
