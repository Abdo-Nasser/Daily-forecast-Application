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
        case id = "id"
        case state = "main"
        case description = "description"
    }
}

extension Weather {
    var toEntity: WeatherEntity {
        let entity = WeatherEntity()
        entity.city = self.city?.toEntity
        entity.statusCode = self.statusCode ?? ""
        
        let list = List<WeatherListEntity>()
        list.append(objectsIn: self.weatherList?.map({$0.toEntity}) ?? [])
        
        entity.weatherList = list
        return entity
    }
}

extension WeatherList {
    var toEntity: WeatherListEntity {
        let entity = WeatherListEntity()
        entity.mainDetails = mainDetails?.toEntity
        
        
        let list = List<WeatherDetailsEntity>()
        list.append(objectsIn: self.weatherDetails?.map({$0.toEntity}) ?? [])
        
        entity.weatherDetails = list
        return entity
    }
}

extension CityWeather {
    var toEntity: CityWeatherEntity {
        let entity = CityWeatherEntity()
        entity.id = self.id ?? 0
        entity.name = self.name ?? ""
        entity.sunset = self.sunset ?? 0
        entity.sunrise = self.sunrise ?? 0
        return entity
    }
}

extension MainDetails {
    var toEntity: MainDetailsEntity {
        let entity = MainDetailsEntity()
        entity.temp = self.temp
        entity.pressure = self.pressure
        entity.humidity = self.humidity
        return entity
    }
}

extension WeatherDetails {
    var toEntity: WeatherDetailsEntity {
        let entity = WeatherDetailsEntity()
        entity.id = self.id ?? 0
        entity.state = self.state ?? ""
        entity.weatherDescription = self.description ?? ""
        return entity
    }
}

