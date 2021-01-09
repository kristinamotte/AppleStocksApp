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
            PlaceholderTextField(placeholder: Text("Search").foregroundColor(.gray), text: $searchItem)
        
            
            Spacer()
        }
        .foregroundColor(.gray)
        .frame(height: 48)
        .background(Color(red: 27/255, green: 28/255, blue: 30/255))
        .cornerRadius(10)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchItem: .constant(""))
    }
}
