//
//  NewsArticleView.swift
//  AppleStocksApp
//
//  Created by Kristina Motte on 1/8/21.
//

import SwiftUI

struct NewsArticleView: View {
    let news: [NewsArticleViewModel]

    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Top News")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                Text("From News")
                    .foregroundColor(.gray)
                    .font(.body)
                    .fontWeight(.regular)
                    .padding(2)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                
                ScrollView {
                    ForEach(news, id: \.title) { article in
                        ArticleView(article: article)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .frame(width: screenSize.width, height: screenSize.height)
        .background(Color(red: 27/255, green: 28/255, blue: 30/255))
        .cornerRadius(12)
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticleView(news: [NewsArticleViewModel(article: Article(title: "Test title", description: "An expanded first round is highlighted by a few tough matchups, including Colts-Bills and Ravens-Titans.", urlToImage: "https://static01.nyt.com/images/2021/01/07/sports/07nfl-matchups-ravenstop/07nfl-matchups-ravenstop-facebookJumbo.jpg"))])
    }
}
