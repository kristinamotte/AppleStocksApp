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

protocol TopNewsService {
    func getTopNews(completion: @escaping ([Article]?) -> Void)
}

final class WebService: StocksService, TopNewsService {
    private struct Constants {
        struct Keys {
            static let country = "country"
            static let apiKey = "apiKey"
        }
        
        struct Values {
            static let country = "us"
            static let newsKeyValue = "68852ffb589f41f6b82a4bc8ca3102aa"
        }
    }

    static let shared = WebService()
    
    func getStocks(completion: @escaping ([Stock]?) -> Void) {
        guard let url = URL(string: Config.URLs.stocksURL) else {
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
    
    func getTopNews(completion: @escaping ([Article]?) -> Void) {
        guard let url = URL(string: Config.URLs.topNewsURL) else {
            completion(nil)
            return
        }
        
        let urlRequest = URLRequest(url: url.with(queryItems: [URLQueryItem(name: Constants.Keys.country, value: Constants.Values.country), URLQueryItem(name: Constants.Keys.apiKey, value: Constants.Values.newsKeyValue)]))
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let topNews = try? JSONDecoder().decode(NewsResponse.self, from: data).articles
            
            completion(topNews)
        }.resume()
    }
}
