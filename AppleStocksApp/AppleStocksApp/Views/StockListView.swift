//
//  StockListView.swift
//  AppleStocksApp
//
//  Created by Kristina Motte on 1/6/21.
//

import SwiftUI

struct StockListView: View {
    let stocks: [StockViewModel]
    
    var body: some View {
        
        List {
            ForEach(stocks, id: \.symbol) { stock in
                StockCellView(stock: stock)
            }.listRowBackground(Color.black)
        }
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        StockListView(stocks: [StockViewModel(stock: Stock(symbol: "GOOG", description: "Google Stocks", price: 2144.3, change: "+0.23"))])
    }
}
