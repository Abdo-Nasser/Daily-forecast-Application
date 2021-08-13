//
//  BaseAPIHeadersProtocol.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import Foundation

protocol BaseAPIHeadersProtocol {
    var commonHeaders: [String: String] { get }
}

extension BaseAPIHeadersProtocol {
    var commonHeaders: [String: String] {
        let headersParameters: [String: String] = ["User-Agent": "PostmanRuntime/7.26.8",
                                                   "Content-type": "application/json"]
        return headersParameters
    }
    
    var authHeaders: [String: String] {
        let authHeaders: [String: String] = ["User-Agent": "PostmanRuntime/7.26.8",
                                             "Content-type": "application/x-www-form-urlencoded"]
        
        return authHeaders
    }
}
