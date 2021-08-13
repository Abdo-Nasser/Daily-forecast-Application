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
    
}
