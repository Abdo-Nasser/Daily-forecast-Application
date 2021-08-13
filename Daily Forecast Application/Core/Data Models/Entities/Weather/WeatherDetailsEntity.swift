//
//  WeatherDetailsEntity.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import RealmSwift

class WeatherDetailsEntity: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var state: String = ""
    @objc dynamic var weatherDescription: String = ""
}

extension WeatherDetailsEntity {
    var toObject: WeatherDetails {
        return WeatherDetails(id: self.id, state: self.state, description: self.weatherDescription)
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
