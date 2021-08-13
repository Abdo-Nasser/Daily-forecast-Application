//
//  RealmService.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import Foundation
import RealmSwift 

class RealmService: RealmServiceProtocol {
    static let shared = RealmService()
    
    let realm = try! Realm()
    
    func setWeather(data: Weather) {
        try? realm.write {
            realm.add(data.toEntity)
        }
    }
    
    func getWeather(cityName: String) -> Weather? {
        let weatherEntities = realm.objects(WeatherEntity.self)
        let weatherEntity = weatherEntities.first(where: { $0.city?.name == cityName.capitalized })
        if let weather = weatherEntity {
            return weather.toObject
        }
        return nil
    }
}
