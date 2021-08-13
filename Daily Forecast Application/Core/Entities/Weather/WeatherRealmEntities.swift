//
//  WeatherRealmEntities.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import Foundation
import RealmSwift

class WeatherEntity: Object {
    @objc dynamic var statusCode: String = ""
    @objc dynamic var city: CityWeatherEntity? = CityWeatherEntity()
    dynamic var weatherList: List<WeatherListEntity>? = List<WeatherListEntity>()
}

class CityWeatherEntity: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var sunset: Int = 0
    @objc dynamic var sunrise: Int = 0
}

class WeatherListEntity: Object {
    @objc dynamic var mainDetails: MainDetailsEntity? = MainDetailsEntity()
    dynamic var weatherDetails: List<WeatherDetailsEntity>? = List<WeatherDetailsEntity>()
}

class MainDetailsEntity: Object {
    dynamic var pressure: Double? = 0
    @objc dynamic var temp: Double = 0
    @objc dynamic var humidity: Double = 0
}

class WeatherDetailsEntity: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var state: String = ""
    @objc dynamic var weatherDescription: String = ""
}

extension WeatherEntity {
    var toObject: Weather {
        return Weather(city: self.city?.toObject ?? CityWeather(), weatherList: weatherList?.map({$0.toObject}))
    }
}

extension CityWeatherEntity {
    var toObject: CityWeather {
        return CityWeather(id: self.id, name: self.name, sunset: self.sunset, sunrise: self.sunrise)
    }
}

extension WeatherListEntity {
    var toObject: WeatherList {
        return WeatherList(mainDetails: self.mainDetails?.toObject ?? MainDetails(), weatherDetails: weatherDetails?.map({$0.toObject}))
    }
}

extension MainDetailsEntity {
    var toObject: MainDetails {
        return MainDetails(temp: self.temp, pressure: self.pressure ?? 0, humidity: self.humidity)
    }
}

extension WeatherDetailsEntity {
    var toObject: WeatherDetails {
        return WeatherDetails(id: self.id, state: self.state, description: self.description)
    }
}
