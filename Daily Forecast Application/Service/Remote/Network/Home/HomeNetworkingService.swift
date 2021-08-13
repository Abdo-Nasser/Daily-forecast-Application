//
//  HomeNetworkingService.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import Foundation

class HomeNetworkingService: MoyaServiceHelper<HomeAPI>, HomeNetworkingServiceProtocol {
    func fetchWeatherForCity(name: String, completion: @escaping (Result<Weather, Error>) -> Void) { 
        request(target: .getWeatherForCity(name: name), completion: completion)
    }
}
