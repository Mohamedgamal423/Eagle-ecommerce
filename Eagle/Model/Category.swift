//
//  Category.swift
//  Eagle
//
//  Created by moh on 3/22/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit


struct Category {
    
    var id: String
    var title: String
    var image: UIImage
    
    init(title: String, id: String, image: UIImage) {
        self.title = title
        self.id = id
        self.image = image
    }
}
