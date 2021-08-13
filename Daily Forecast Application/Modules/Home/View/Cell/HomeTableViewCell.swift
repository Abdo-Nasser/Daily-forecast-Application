//
//  HomeTableViewCell.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var stateLabel: UILabel!
    @IBOutlet private weak var tempValueLabel: UILabel!
    @IBOutlet private weak var pressureValueLabel: UILabel!
    @IBOutlet private weak var humidityValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Configuration Methods
extension HomeTableViewCell {
    func configure(weather: WeatherList) {
        stateLabel.text = weather.weatherDetails?.first?.description ?? ""
        tempValueLabel.text = "\(weather.mainDetails?.temp ?? 0)"
        pressureValueLabel.text = "\(weather.mainDetails?.pressure ?? 0)"
        humidityValueLabel.text = "\(weather.mainDetails?.humidity ?? 0)"
    }
}
