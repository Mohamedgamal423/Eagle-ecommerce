//
//  Categoriesopencell.swift
//  Eagle
//
//  Created by moh on 2/6/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class Categoriesopencell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var title: UILabel!
    
    func updateviews(product: Product) {
        img.image = product.images[0]
        img.layer.cornerRadius = 16
        price.text = "\(product.price) $"
        title.text = product.title
        
   }
}
