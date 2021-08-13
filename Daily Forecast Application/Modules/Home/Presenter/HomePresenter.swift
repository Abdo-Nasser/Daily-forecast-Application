//
//  HomePresenter.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import Foundation

class HomePresenter {
    
    // MARK: - Attributes
    weak var view: HomeViewControllerProtocol?
    var interactor:  HomeInteractorProtocol
    var router:  HomeRouterProtocol
    var uiModel:  HomeUIModel
    
    // MARK: - Initializer
    init(view:  HomeViewControllerProtocol,
         interactor:  HomeInteractorProtocol,
         router:  HomeRouterProtocol,
         uiModel:  HomeUIModel) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.uiModel = uiModel
    }
}

// MARK: - HomePresenterProtocol Methods
extension HomePresenter: HomePresenterProtocol {
    func getCityWeather(cityName: String) {
        interactor.getCityWeather(cityName: cityName) { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.uiModel.dataSourceType = response.dataSourceType
                self?.uiModel.weather = response.weather
                self?.view?.updateUI()
            case .failure:
                self?.view?.showErrorView()
            }
        }
    }
}
