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
    let source: Source
    let title: String
    let urlToImage: String
}

struct Source: Codable {
    let id: String?
    let name: String
}
