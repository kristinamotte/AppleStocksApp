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
        HStack {
            VStack(alignment: .leading) {
                Text(article.title)
                    .foregroundColor(.white)
                    .font(.custom("Arial", size: 22))
                    .bold()

                Text(article.description)
                    .foregroundColor(.white)
                    .font(.custom("Arial", size: 20))

                Spacer()
            }
            .background(Color(red: 27/255, green: 28/255, blue: 30/255))
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: NewsArticleViewModel(article: Article(title: "Test", description: "An expanded first round is highlighted by a few tough matchups", urlToImage: "https://static01.nyt.com/images/2021/01/07/sports/07nfl-matchups-ravenstop/07nfl-matchups-ravenstop-facebookJumbo.jpg")))
    }
}
