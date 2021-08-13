//
//  HomeInteractor.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import Foundation

class HomeInteractor: HomeInteractorProtocol {
    func getCityWeather(cityName: String, completion: @escaping (Result<(weather: Weather, dataSourceType: DataSourceType), Error>) -> Void) {
        fetchWeatherForCity(name: cityName) { [weak self] result in
            switch result {
            case .success(let data):
                self?.handleFetchingWeatherSuccess(data: (data, .remote), cityName: cityName, completion: completion)
            case .failure(let error):
                self?.handleFetchingWeatherFailure(error: error, cityName: cityName, completion: completion)
            }
        }
    }
}

// MARK: - Data Handler
extension HomeInteractor {
    
    private func handleFetchingWeatherSuccess(data: (weather: Weather, dataSourceType: DataSourceType), cityName: String, completion: (Result<(weather: Weather, dataSourceType: DataSourceType), Error>) -> Void) {
        // save data
        if let list = data.weather.weatherList, !list.isEmpty {
            setWeather(data: data.weather)
            completion(.success(data))
        } else {
            let error = NSError(domain: "Empty Data", code: 0, userInfo: [:])
            self.handleFetchingWeatherFailure(error: error, cityName: cityName, completion: completion)
        }
    }
    
    private func handleFetchingWeatherFailure(error: Error?, cityName: String,  completion: (Result<(weather: Weather, dataSourceType: DataSourceType), Error>) -> Void) {
        // check error type
        getWeatherFromLocalService(cityName: cityName, completion: completion)
    }
}

// MARK: - Local Data Methods
extension HomeInteractor {
    private func getWeatherFromLocalService(cityName: String, completion: (Result<(weather: Weather, dataSourceType: DataSourceType), Error>) -> Void){
        if let weather = getWeather(cityName: cityName) {
            completion(.success((weather, .local)))
        } else {
            completion(.failure(NSError(domain: "", code: 1, userInfo: nil)))
        }
    }
}


