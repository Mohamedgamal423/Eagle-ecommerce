//
//  Categcollcell.swift
//  Eagle
//
//  Created by moh on 3/13/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class Photoscollcell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    
    func configurecell(image: UIImage) {
        img.image = image
    }
}
