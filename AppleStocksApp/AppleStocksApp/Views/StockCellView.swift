//
//  StockCellView.swift
//  AppleStocksApp
//
//  Created by Kristina Motte on 1/6/21.
//

import SwiftUI

struct StockCellView: View {
    let stock: StockViewModel
    
    var body: some View {
        ZStack {
            Color.black
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
                    Text(stock.change)
                        .frame(width: 75)
                        .padding(5)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(6)
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}


struct StockCellView_Previews: PreviewProvider {
    static var previews: some View {
        StockCellView(stock: StockViewModel(stock: Stock(symbol: "OMG", description: "Corporation", price: 123.2, change: "-1.344")))
    }
}
