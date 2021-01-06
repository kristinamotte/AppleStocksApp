//
//  WebService.swift
//  AppleStocksApp
//
//  Created by Kristina Motte on 1/6/21.
//

import Foundation

class WebService {
    func getStocks(completion: @escaping ([Stock]?) -> Void) {
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
            DispatchQueue.main.async {
                completion(nil)
            }
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            
            DispatchQueue.main.async {
                completion(stocks)
            }
        }.resume()
    }
}
