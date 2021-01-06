//
//  ContentView.swift
//  AppleStocksApp
//
//  Created by Kristina Motte on 1/5/21.
//

import SwiftUI

struct ContentView: View {
    @State private var searchTearm: String = ""
    
    init() {
        UINavigationBar.appearance().backgroundColor = .black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = .black
        UITableViewCell.appearance().backgroundColor = .black
    }
    
    var body: some View {
        NavigationView() {
            ZStack(alignment: .leading) {
                Color.black.edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    Text("January 5")
                        .foregroundColor(.gray)
                        .font(.custom("Arial", size: 32))
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 0))
                    
                    SearchView(searchItem: $searchTearm)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    Spacer()
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
