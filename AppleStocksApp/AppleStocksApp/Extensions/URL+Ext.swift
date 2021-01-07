//
//  URL+Ext.swift
//  AppleStocksApp
//
//  Created by Kristina Motte on 1/7/21.
//

import Foundation

extension URL {
    func with(queryItems: [URLQueryItem]) -> URL {
        guard !queryItems.isEmpty, var components = URLComponents(url: self, resolvingAgainstBaseURL: true) else { return self }
        components.queryItems = (components.queryItems ?? []) + queryItems
    
        return components.url ?? self
    }
}
