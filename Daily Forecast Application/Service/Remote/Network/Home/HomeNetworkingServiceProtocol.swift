//
//  HomeNetworkingServiceProtocol.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import Foundation

protocol HomeNetworkingServiceProtocol {
    func fetchWeatherForCity(name: String, completion: @escaping (Result<Weather, Error>) -> Void)
}

extension HomeNetworkingServiceProtocol {
    
    func fetchWeatherForCity(name: String, completion: @escaping (Result<Weather, Error>) -> Void) {
        let service = HomeNetworkingService()
        service.fetchWeatherForCity(name: name, completion: completion)
    }
}
