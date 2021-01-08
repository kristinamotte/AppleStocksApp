//
//  NewsArticleViewModel.swift
//  AppleStocksApp
//
//  Created by Kristina Motte on 1/8/21.
//

import Foundation

struct NewsArticleViewModel {
    let article: Article
    
    var imageURL: String {
        return article.urlToImage
    }
    
    var title: String {
        return article.title
    }
    
    var publisher: String {
        return article.source.name.uppercased()
    }
}
