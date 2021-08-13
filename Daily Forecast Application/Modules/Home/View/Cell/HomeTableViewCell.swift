//
//  HomeTableViewCell.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var tempValueLabel: UILabel!
    @IBOutlet weak var pressureValueLabel: UILabel!
    @IBOutlet weak var humidityValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(weather: WeatherList){
        stateLabel.text = weather.weatherDetails?.first?.state ?? ""
        tempValueLabel.text = "\(weather.mainDetails?.temp ?? 0)"
        pressureValueLabel.text = "\(weather.mainDetails?.pressure ?? 0)"
        humidityValueLabel.text = "\(weather.mainDetails?.humidity ?? 0)"
    }
}
