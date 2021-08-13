//
//  WeatherEntity.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import RealmSwift

class WeatherEntity: Object {
    @objc dynamic var statusCode: String = ""
    @objc dynamic var city: CityWeatherEntity? = CityWeatherEntity()
    dynamic var weatherList: List<WeatherListEntity>? = List<WeatherListEntity>()
}

extension WeatherEntity {
    var toObject: Weather {
        return Weather(city: self.city?.toObject ?? CityWeather(), weatherList: weatherList?.map({$0.toObject}))
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
