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
        registerTableViewCell()
        setupTableViewDelegates()
    }
    
    //MARK: - Actions
    @IBAction func searchAction(_ sender: Any) {
    }
    
    @IBAction func retryAction(_ sender: Any) {
    }
}

extension HomeViewController: HomeViewControllerProtocol{
    func updateUI() {
        tableView.reloadData()
    }
}

//MARK: - TableView Delegate and DataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func setupTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerTableViewCell(){
        tableView.register(HomeTableViewCell.nib, forCellReuseIdentifier: HomeTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.uiModel.weather?.weatherList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
        cell.configure(weather: presenter?.uiModel.weather?.weatherList?[indexPath.row] ?? WeatherList())
        return cell
    }
}
