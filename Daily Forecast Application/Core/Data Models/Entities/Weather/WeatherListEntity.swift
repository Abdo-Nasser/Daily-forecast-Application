//
//  WeatherListEntity.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import RealmSwift

class WeatherListEntity: Object {
    @objc dynamic var mainDetails: MainDetailsEntity? = MainDetailsEntity()
    dynamic var weatherDetails: List<WeatherDetailsEntity>? = List<WeatherDetailsEntity>()
}

extension WeatherListEntity {
    var toObject: WeatherList {
        return WeatherList(mainDetails: self.mainDetails?.toObject ?? MainDetails(), weatherDetails: weatherDetails?.map({$0.toObject}))
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
