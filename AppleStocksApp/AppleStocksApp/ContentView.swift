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
    
        NavigationView() {
            ZStack(alignment: .leading) {
                Color.black.edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    Text("January 5")
                        .foregroundColor(.gray)
                        .font(.custom("Arial", size: 32))
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 0))
                    
                    SearchView(searchItem: $stockListViewModel.searchTerm)
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    StockListView(stocks: filteredStocks)
                        
                    NewsArticleView(news: stockListViewModel.articles)
                        .padding(.bottom)
                        .frame(width: 400.0, height: 150.0)
                        .offset(y: UIScreen.main.bounds.height / 2.5)
                }
            }
            
            .navigationBarTitle("Stocks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
