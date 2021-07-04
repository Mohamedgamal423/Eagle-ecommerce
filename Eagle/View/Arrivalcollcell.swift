//
//  Arrivalcell.swift
//  Eagle
//
//  Created by moh on 2/11/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class Arrivalcollcell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    
    func configurecell(product: Product) {
        img.image = product.images[0]
        title.text = product.title
        price.text = String(describing: product.price) 
    }

}
