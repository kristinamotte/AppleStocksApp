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
    let source: Source?
    let title: String?
    let urlToImage: String?
    let url: String?
    let publishedAt: String?
    let author: String?
    let description: String?
    let content: String?
}

struct Source: Codable {
    let id: String?
    let name: String?
}
