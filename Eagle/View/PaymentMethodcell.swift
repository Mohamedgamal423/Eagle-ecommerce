//
//  PaymentMethodcell.swift
//  Eagle
//
//  Created by moh on 3/5/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class PaymentMethodcell: UITableViewCell {

    @IBOutlet weak var paymentimg: UIImageView!
    @IBOutlet weak var Paymenttitle: UILabel!
    
    func configurecell(payment: PaymentMethod) {
        paymentimg.image = UIImage(named: payment.imagename)
        Paymenttitle.text = payment.name
    }


}
