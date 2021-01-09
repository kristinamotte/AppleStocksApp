//
//  StockListViewModel.swift
//  AppleStocksApp
//
//  Created by Kristina Motte on 1/6/21.
//

import SwiftUI

class StockListViewModel: ObservableObject {
    @Published var dragOffset: CGSize = CGSize(width: 0, height: UIScreen.main.bounds.height / 1.9)
    @Published var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = []
    @Published var articles: [NewsArticleViewModel] = []
    
    // MARK: Services
    let webService: StocksService & TopNewsService = WebService.shared
    
    func loadData() {
        fetchStocks()
        fetchNews()
    }
    
    private func fetchStocks() {
        webService.getStocks { (stocks) in
            if let stocks = stocks {
                self.stocks = stocks.map(StockViewModel.init)
            }
        }
    }
    
    private func fetchNews() {
        webService.getTopNews { (atricles) in
            if let atricles = atricles {
                self.articles = atricles.map(NewsArticleViewModel.init)
            }
        }
    }
}
