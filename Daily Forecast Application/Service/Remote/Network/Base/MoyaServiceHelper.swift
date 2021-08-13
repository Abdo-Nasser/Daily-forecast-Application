//
//  MoyaServiceHelper.swift
//  Daily Forecast Application
//
//  Created by Abdelrahman Nasser on 8/13/21.
//

import Foundation
import Moya

class MoyaServiceHelper<T:TargetType> {
    
    // MARK:- Properties
    var provider: MoyaProvider<T>!
    
    // MARK:- Init
    init(type: NetworkServiceType = .live) {
        let serviceType = type == .live ? MoyaProvider<T>.neverStub : MoyaProvider<T>.immediatelyStub
        provider = MoyaProvider<T>(stubClosure: serviceType, plugins: [])
    }
    
    func request<R: Codable>(target: T, completion: @escaping (Result<R, Error>) -> Void) {
        print("🤩 Network Call: \(T.self)")
        provider.request(target) { result in
            switch result {
            case .success(let value):
                let decoder = JSONDecoder()
                do {
                    let result = String(decoding: value.data, as: UTF8.self)
                    print("🤩 Network Call Success For \(T.self) \n🤩 result: \(result)")
                    let response = try decoder.decode(R.self, from: value.data)
                    completion(.success(response))
                }
                catch let error {
                    print("🤯 Decoder Failure For \(T.self) \nError: \(error)")
                    completion(.failure(error))
                }
                
            case .failure(let error):
                print("🤯 Network Call Failure For \(T.self) \nError: \(error)")
                completion(.failure(error))
            }
        }
    }
}

