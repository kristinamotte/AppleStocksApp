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

struct StockCellView: View {
    let stock: StockViewModel
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(stock.symbol)
                        .font(.custom("Arial", size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                    Text(stock.description)
                        .font(.custom("Arial", size: 18))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("$" + stock.price)
                        .font(.custom("Arial", size: 22))
                        .foregroundColor(.white)
                    Button(stock.change) {
                        
                    }
                    .frame(width: 75)
                    .padding(5)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                    
                }
            }
        }
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        StockListView(stocks: [StockViewModel(stock: Stock(symbol: "GOOG", description: "Google Stocks", price: 2144.3, change: "+0.23"))])
    }
}
