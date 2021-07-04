//
//  Product.swift
//  Eagle
//
//  Created by moh on 2/6/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

struct Product {
    
    var title: String
    var id: String
    var images: [UIImage]
    var colors: [String]
    var size: [String]
    var price: Int
    var descrip: String
    var CatID: String
    var imagesurls: [String]
    
    init(title: String, id: String, images: [UIImage], size: [String], colors: [String], price: Int, descrip: String, catID: String, imagesurls: [String]) {
        self.title = title
        self.id = id
        self.images = images
        self.colors = colors
        self.size = size
        self.price = price
        self.descrip = descrip
        self.CatID = catID
        self.imagesurls = imagesurls
    }
}
