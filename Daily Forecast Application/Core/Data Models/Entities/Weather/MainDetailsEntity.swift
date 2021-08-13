//
//  MainDetailsEntity.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import RealmSwift

class MainDetailsEntity: Object {
    @objc dynamic var pressure: Double = 0
    @objc dynamic var temp: Double = 0
    @objc dynamic var humidity: Double = 0
}

extension MainDetailsEntity {
    var toObject: MainDetails {
        return MainDetails(temp: self.temp, pressure: self.pressure, humidity: self.humidity)
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
