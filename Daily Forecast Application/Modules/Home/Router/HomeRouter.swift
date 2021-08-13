//
//  HomeRouter.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import UIKit

class HomeRouter: HomeRouterProtocol {
    
    weak var view: UIViewController?
    
    static func createHomeModule() -> UIViewController{
        let view = HomeViewController()
        let uiModel = HomeUIModel()
        let router = HomeRouter()
        let interactor = HomeInteractor()
        
        let presenter = HomePresenter(view: view, interactor: interactor, router: router, uiModel: uiModel)
        
        view.presenter = presenter
        router.view = view
        return view
    }
    
    func navigate(to route: HomeRoute) {
    }
}
