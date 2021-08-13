//
//  Base.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import Foundation

//MARK: - Switch live to testing and the otherwise
enum NetworkServiceType {
    case live
    case test
}

//MARK: - Response
public struct BaseResponse<T: Codable>: Codable {
    public var status: String?
    public var data: T?
}
