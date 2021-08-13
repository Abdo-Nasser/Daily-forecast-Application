//
//  HomeAPI.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import Moya

enum HomeAPI {
    case getWeatherForCity(name: String)
}

extension HomeAPI: TargetType, BaseAPIHeadersProtocol {
    var baseURL: URL {
        // set baseURL
        let stringURL = "baseURL"
        guard let url = URL(string: stringURL) else { fatalError("stringURL could not be configured") }
        return url
    }
    
    var path: String {
        switch self {
        case .getWeatherForCity: return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getWeatherForCity:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return [:]
    }
    
    var task: Task {
        switch self {
        case .getWeatherForCity(_):
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        }
    }
}
