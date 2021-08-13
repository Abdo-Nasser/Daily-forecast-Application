//
//  MainDetails.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import Foundation

struct MainDetails: Codable {
    var temp: Double = 0
    var pressure: Double = 0
    var humidity: Double = 0
    
    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
    }
}
