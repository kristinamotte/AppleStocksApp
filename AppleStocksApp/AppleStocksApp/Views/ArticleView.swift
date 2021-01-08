//
//  ArticleView.swift
//  AppleStocksApp
//
//  Created by Kristina Motte on 1/8/21.
//

import SwiftUI

struct ArticleView: View {
    let article: NewsArticleViewModel

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(article.publisher)
                    .foregroundColor(.white)
                    .font(.custom("Arial", size: 22))
                    .bold()
                    .padding([.bottom], 2)
                Text(article.title)
                    .foregroundColor(.gray)
                    .font(.custom("Arial", size: 20))

                Spacer()
            }
            Spacer()
            URLImage(url: article.imageURL)
                .frame(width: 100, height: 100)
           
        }.background(Color(red: 27/255, green: 28/255, blue: 30/255))
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: NewsArticleViewModel(article: Article(source: Source(id: nil, name: "CNN"), title: "Test", urlToImage: "https://static01.nyt.com/images/2021/01/07/sports/07nfl-matchups-ravenstop/07nfl-matchups-ravenstop-facebookJumbo.jpg")))
    }
}
