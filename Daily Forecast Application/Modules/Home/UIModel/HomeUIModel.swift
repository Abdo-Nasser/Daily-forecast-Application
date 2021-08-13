//
//  HomeUIModel.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import Foundation

struct HomeUIModel {
    var dataSourceType: DataSourceType = .none
    var weather: Weather? = nil
}

enum DataSourceType {
    case local
    case remote
    case none
}
