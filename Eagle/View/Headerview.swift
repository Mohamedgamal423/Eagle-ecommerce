//
//  Headerview.swift
//  Eagle
//
//  Created by moh on 3/16/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class Headerview: UITableViewHeaderFooterView {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var viewmoBtn: UIButton!
    var delegate: Cellprot?
    
    @IBAction func ViewBtn(_ sender: Any) {
        delegate?.mn(catid: "kloj")
    }
}
