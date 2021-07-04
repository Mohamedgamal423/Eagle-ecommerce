//
//  Bestsellercolcell.swift
//  Eagle
//
//  Created by moh on 3/13/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class Bestsellercolcell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    
    func configurecell(product: Product) {
        img.image = product.images[0]
    }

}
