//
//  Config.swift
//  AppleStocksApp
//
//  Created by Kristina Motte on 1/7/21.
//

import Foundation

struct Config {
    struct URLs {
        /// For top news fetching
        static let topNewsURL: String = {
            return "http://newsapi.org/v2/top-headlines"
        }()
        
        /// For stocks fetching
        static let stocksURL: String = {
            return "https://even-roasted-bike.glitch.me/stocks"
        }()
    }
}
