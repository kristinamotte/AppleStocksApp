//
//  SearchView.swift
//  AppleStocksApp
//
//  Created by Kristina Motte on 1/6/21.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchItem: String
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "magnifyingglass")
                .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 0))
            TextField("Search", text: $searchItem)
            
            Spacer()
        }
        .foregroundColor(.gray)
        .frame(height: 60)
        .background(Color(.darkGray))
        .cornerRadius(10)
        .padding(10)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchItem: .constant(""))
    }
}
