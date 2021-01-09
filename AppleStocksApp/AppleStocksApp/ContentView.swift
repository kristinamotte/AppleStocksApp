//
//  ContentView.swift
//  AppleStocksApp
//
//  Created by Kristina Motte on 1/5/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var stockListViewModel = StockListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = .black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = .black
        stockListViewModel.loadData()
    }
    
    var body: some View {
        let filteredStocks = stockListViewModel.searchTerm.isEmpty ? stockListViewModel.stocks : stockListViewModel.stocks.filter { $0.symbol.starts(with: stockListViewModel.searchTerm) }
    
            ZStack(alignment: .leading) {
                Color.black.edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    Text("Stocks")
                        .foregroundColor(.white)
                        .font(.custom("Arial", size: 36))
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 0))
                    Text("January 5")
                        .foregroundColor(.gray)
                        .font(.custom("Arial", size: 32))
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 2, leading: 16, bottom: 0, trailing: 0))
                    
                    SearchView(searchItem: $stockListViewModel.searchTerm)
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                    StockListView(stocks: filteredStocks)
                        
                    NewsArticleView(news: stockListViewModel.articles, onDragBegin: { value in
                        stockListViewModel.dragOffset = value.translation
                    }, onDragEnd: { value in
                        if value.translation.height < 0 {
                            stockListViewModel.dragOffset.height = -250
                        } else {
                            stockListViewModel.dragOffset.height = UIScreen.main.bounds.height / 1.9
                        }
                    })
                        .padding(.bottom)
                        .frame(width: 400.0, height: 150.0)
                    .animation(.spring())
                    .offset(y: stockListViewModel.dragOffset.height)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
