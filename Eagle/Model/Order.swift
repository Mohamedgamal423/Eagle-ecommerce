//
//  Order.swift
//  Eagle
//
//  Created by moh on 6/13/21.
//  Copyright © 2021 moh. All rights reserved.
//

import Foundation

struct Order {
    
    var productsIds: [String]
    //var ownerId: String
    var ownerAddress: [String]
    var shippingAddress: [String]
    var status: String
    var price: Int
}
