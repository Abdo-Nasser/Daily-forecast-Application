//
//  CityWeatherEntity.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import RealmSwift

class CityWeatherEntity: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var sunset: Int = 0
    @objc dynamic var sunrise: Int = 0
}

extension CityWeatherEntity {
    var toObject: CityWeather {
        return CityWeather(id: self.id, name: self.name, sunset: self.sunset, sunrise: self.sunrise)
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
