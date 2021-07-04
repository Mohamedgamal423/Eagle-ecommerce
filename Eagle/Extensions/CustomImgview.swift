//
//  CustomImgview.swift
//  Eagle
//
//  Created by moh on 2/3/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class CustomImgview: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makecircledge()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        makecircledge()
    }
    
    func MakecircularImage() {
        //layer.cornerRadius = self.frame.size.width / 0.6
        layer.cornerRadius = self.bounds.width / 2
        //layer.masksToBounds = true
        //clipsToBounds = true
    }
    func makecircledge() {
        layer.cornerRadius = 16
        layer.masksToBounds = true
    }
    
}
