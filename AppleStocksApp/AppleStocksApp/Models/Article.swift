//
//  News.swift
//  AppleStocksApp
//
//  Created by Kristina Motte on 1/7/21.
//

import Foundation

struct NewsResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String
    let description: String
    let urlToImage: String
}
