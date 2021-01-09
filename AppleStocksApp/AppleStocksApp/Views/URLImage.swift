//
//  URLImage.swift
//  AppleStocksApp
//
//  Created by Kristina Motte on 1/8/21.
//

import SwiftUI

struct URLImage: View {
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, placeholder: String = "placeholder") {
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url)
    }

    var body: some View {
        if let data = imageLoader.downloadedData, let image = UIImage(data: data) {
            return Image(uiImage: image).resizable()
        } else {
            return Image(placeholder).resizable()
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiHN7dng6smHzqrEXGmSTTbJxR2yjJoRYe1A&usqp=CAU")
    }
}
