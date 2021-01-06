//
//  WebService.swift
//  AppleStocksApp
//
//  Created by Kristina Motte on 1/6/21.
//

import Foundation

protocol StocksService {
    func getStocks(completion: @escaping ([Stock]?) -> Void)
}

final class WebService: StocksService {
    static let shared = WebService()
    
    func getStocks(completion: @escaping ([Stock]?) -> Void) {
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            
            completion(stocks)
        }.resume()
    }
}
