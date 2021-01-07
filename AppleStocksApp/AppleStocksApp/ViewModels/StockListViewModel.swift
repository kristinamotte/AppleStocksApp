//
//  StockListViewModel.swift
//  AppleStocksApp
//
//  Created by Kristina Motte on 1/6/21.
//

import Foundation

class StockListViewModel: ObservableObject {
    @Published var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = []
    
    // MARK: Services
    let webService: StocksService & TopNewsService = WebService.shared
    
    func fetchStocks() {
        webService.getStocks { (stocks) in
            if let stocks = stocks {
                DispatchQueue.main.async {
                    self.stocks = stocks.map(StockViewModel.init)
                }
            }
        }
    }
    
    func fetchNews() {
        webService.getTopNews { (atricles) in
            print(atricles)
        }
    }
}
