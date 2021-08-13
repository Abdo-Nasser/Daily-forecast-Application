//
//  RealmService.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import Foundation
import RealmSwift 

class RealmService {
    static let shared = RealmService()
    let realm = try! Realm()

    func setWeather(data: Weather) {
        try? realm.write {
                realm.add(data.toEntity)
            }
    }

    func getWeather(cityName: String) -> Weather? {
        if ((realm.objects(WeatherEntity.self).first(where: {$0.city?.name == cityName.capitalized})) != nil) {
            let weather = realm.objects(WeatherEntity.self).filter({$0.city?.name == cityName.capitalized})
            return weather[0].toObject
        }
        return nil
    }
}
