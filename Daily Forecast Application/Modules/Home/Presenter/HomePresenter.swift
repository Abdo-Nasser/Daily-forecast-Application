//
//  HomePresenter.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    //MARK: - Attributes
    weak var view: HomeViewControllerProtocol?
    var interactor:  HomeInteractorProtocol
    var router:  HomeRouterProtocol
    var uiModel:  HomeUIModel
    
    init(view:  HomeViewControllerProtocol,
         interactor:  HomeInteractorProtocol,
         router:  HomeRouterProtocol,
         uiModel:  HomeUIModel) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.uiModel = uiModel
    }
    
    func getCityWeather(cityName: String) {
        interactor.getCityWeather(cityName: cityName) { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.uiModel.dataSourceType = response.dataSourceType
                self?.uiModel.weather = response.weather
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
}
