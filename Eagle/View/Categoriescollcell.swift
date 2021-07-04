//
//  Categoriescollcell.swift
//  Eagle
//
//  Created by moh on 2/4/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class Categoriescollcell: UICollectionViewCell {
    
    @IBOutlet weak var Cattitle: UILabel!
    @IBOutlet weak var Catimage: UIImageView!
    
    func configurecell(category: Category) {
        DispatchQueue.main.async {
            self.Catimage.image = category.image
        }
        //Catimage.image = category.image
        Cattitle.text = category.title
    }
    
}
