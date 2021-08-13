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
    
    //MARK: - Outlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var notAccurateView: UIView!
    @IBOutlet weak var errorView: UIView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.getCityWeather(cityName: "cairo")
    }
    
    private func setupUI(){
        
    }
    
    //MARK: - Actions
    @IBAction func searchAction(_ sender: Any) {
    }
    
    @IBAction func retryAction(_ sender: Any) {
    }
}

extension HomeViewController: HomeViewControllerProtocol{
    func updateUI() {
    }
}
