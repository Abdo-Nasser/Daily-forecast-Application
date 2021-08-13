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
        let stringURL = Constant.baseURL
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
        case .getWeatherForCity(let name):
            return .requestParameters(parameters: ["q": name, "appid": Constant.apiKey], encoding: URLEncoding.default)
        }
    }
}
