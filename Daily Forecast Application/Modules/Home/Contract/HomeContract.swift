//
//  HomeContract.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import Foundation

// MARK: - Routes
enum HomeRoute {
}

// MARK: - Router
protocol HomeRouterProtocol {
    func navigate(to route: HomeRoute)
}

// MARK: - Presenter
protocol HomePresenterProtocol: class {
    var uiModel: HomeUIModel { get }
    
    func getCityWeather(cityName: String)
}

// MARK: - Interactor
protocol HomeInteractorProtocol: HomeNetworkingServiceProtocol, RealmServiceProtocol{
    func getCityWeather(cityName: String, completion: @escaping (Result<(weather: Weather, dataSourceType: DataSourceType), Error>) -> Void)
}

// MARK: - ViewProtocol
protocol HomeViewControllerProtocol: class {
    var presenter: HomePresenterProtocol? { get set }
    
    func updateUI()
}
