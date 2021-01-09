//
//  NewsArticleView.swift
//  AppleStocksApp
//
//  Created by Kristina Motte on 1/8/21.
//

import SwiftUI

struct NewsArticleView: View {
    let news: [NewsArticleViewModel]
    let onDragBegin: (DragGesture.Value) -> Void
    let onDragEnd: (DragGesture.Value) -> Void

    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        
        VStack(alignment: .leading) {
            HStack {
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
                        .padding(EdgeInsets(top: 2, leading: 16, bottom: 8, trailing: 16))
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .padding([.bottom, .top], 8)
                }
                Spacer()
            }
            .contentShape(Rectangle())
            .gesture(DragGesture()
                        .onChanged(onDragBegin)
                        .onEnded(onDragEnd))
                
                ScrollView {
                    ForEach(news, id: \.title) { article in
                        ArticleView(article: article)
                            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    }
                }.frame(maxWidth: .infinity)
            Rectangle()
                .frame(height: 32)
                .foregroundColor(Color(red: 27/255, green: 28/255, blue: 30/255))
                .padding([.bottom, .top], 8)
        }
        .frame(width: screenSize.width, height: screenSize.height)
        .background(Color(red: 27/255, green: 28/255, blue: 30/255))
        .cornerRadius(12)
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticleView(news: [NewsArticleViewModel(article: Article(source: Source(id: nil, name: "CNN"), title: "Test", urlToImage: "https://static01.nyt.com/images/2021/01/07/sports/07nfl-matchups-ravenstop/07nfl-matchups-ravenstop-facebookJumbo.jpg", url: "https://static01.nyt.com/images/2021/01/07/sports/07nfl-matchups-ravenstop/07nfl-matchups-ravenstop-facebookJumbo.jpg", publishedAt: "", author: "", description: "", content: ""))], onDragBegin: { _ in }, onDragEnd: { _ in })
    }
}
