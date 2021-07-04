//
//  Countriescell.swift
//  Eagle
//
//  Created by moh on 3/9/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class Countriescell: UITableViewCell {

    @IBOutlet weak var flag: UIImageView!
    @IBOutlet weak var code: UILabel!
    
    func configurecell(country: Country) {
        flag.image = country.flag
        code.text = country.code
    }
    

}
