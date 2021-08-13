//
//  RealmServiceProtocol.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import Foundation

protocol RealmServiceProtocol {
    func setWeather(data: Weather)
    func getWeather(cityName: String) -> Weather?
}

extension RealmServiceProtocol {
    func setWeather(data: Weather) {
          let service = RealmService.shared
          service.setWeather(data: data)
    }

    func getWeather(cityName: String) -> Weather? {
        let service = RealmService.shared
        return service.getWeather(cityName: cityName)
    }
}
