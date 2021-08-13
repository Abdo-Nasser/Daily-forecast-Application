//
//  HomeViewController.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: - Attributes
    var presenter: HomePresenterProtocol?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController: HomeViewControllerProtocol{
    func updateUI() {
    }
}
