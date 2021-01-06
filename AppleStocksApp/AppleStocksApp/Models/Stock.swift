//
//  Stock.swift
//  AppleStocksApp
//
//  Created by Kristina Motte on 1/6/21.
//

import Foundation

struct Stock: Codable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
