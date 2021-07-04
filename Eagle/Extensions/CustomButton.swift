//
//  CustomButton.swift
//  Eagle
//
//  Created by moh on 2/2/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    func defaultsetup() {
        layer.cornerRadius = self.bounds.height / 2
        layer.masksToBounds = true
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        let firstcolor = #colorLiteral(red: 0.9607843137, green: 0.6784313725, blue: 0.1411764706, alpha: 1).cgColor
        let secondcolor = #colorLiteral(red: 0.9725490196, green: 0.7921568627, blue: 0.4549019608, alpha: 1).cgColor
        gradient.colors = [firstcolor, secondcolor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        layer.addSublayer(gradient)
    }
    func makewhiteBtn() {
        layer.cornerRadius = self.bounds.height / 2
        layer.masksToBounds = true
        backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9607843137, blue: 0.968627451, alpha: 1)
    }
    func makecustomBtn(backgroundcolor: UIColor, bordercolor: UIColor?) {
        if bordercolor != nil {
            layer.borderColor = bordercolor?.cgColor
            layer.borderWidth = 1
        }
        layer.cornerRadius = self.bounds.height / 2
        layer.masksToBounds = true
        backgroundColor = backgroundColor
        
    }
    
    
}
