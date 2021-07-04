//
//  CollectionViewCell.swift
//  Eagle
//
//  Created by moh on 2/8/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupview()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupview() {
        img.image = UIImage(named: "yt")
    }
}
