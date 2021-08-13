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
}

// MARK: - Interactor
protocol HomeInteractorProtocol: class{
}

// MARK: - ViewProtocol
protocol HomeViewControllerProtocol: class {
    var presenter: HomePresenterProtocol? { get set }
    
    func updateUI()
}
