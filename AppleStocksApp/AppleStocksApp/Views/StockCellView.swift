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
            VStack {
                HStack {
                    Text(stock.symbol)
                        .font(.custom("Arial", size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                    Spacer()
                    Text(stock.price)
                        .font(.custom("Arial", size: 22))
                        .foregroundColor(.white)
                }
                HStack {
                    Text(stock.description)
                        .font(.custom("Arial", size: 18))
                        .foregroundColor(.gray)
                    Spacer()
                    Text(stock.change)
                        .frame(width: 75)
                        .padding(5)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(6)
                }
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color(red: 27/255, green: 28/255, blue: 30/255))
                    .padding([.bottom, .top], 8)
            }.buttonStyle(PlainButtonStyle())
        }
    }
}


struct StockCellView_Previews: PreviewProvider {
    static var previews: some View {
        StockCellView(stock: StockViewModel(stock: Stock(symbol: "OMG", description: "Corporation", price: 123.2, change: "-1.344")))
    }
}
