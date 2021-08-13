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
    @IBOutlet weak var writeCityNameLabel: UILabel!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        registerTableViewCell()
        setupTableViewDelegates()
        textField.delegate = self
    }
    
    //MARK: - Actions
    @IBAction func searchAction(_ sender: Any) {
        guard let text = textField.text else { return }
        
        view.endEditing(true)
        let isValidText = !text.isEmpty
        writeCityNameLabel.isHidden = isValidText
        presenter?.getCityWeather(cityName: text)
    }
    
    @IBAction func retryAction(_ sender: Any) {
        presenter?.getCityWeather(cityName: textField.text ?? "")
    }
}

extension HomeViewController: HomeViewControllerProtocol{
    func updateUI() {
        notAccurateView.isHidden = !(presenter?.uiModel.dataSourceType.rawValue == DataSourceType.local.rawValue)
        writeCityNameLabel.isHidden = true
        tableView.isHidden = false
        errorView.isHidden = true
        tableView.reloadData()
    }
    
    func showErrorView(){
        writeCityNameLabel.isHidden = true
        tableView.isHidden = true
        errorView.isHidden = false
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



//MARK: - TableView Delegate and DataSource
extension HomeViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
