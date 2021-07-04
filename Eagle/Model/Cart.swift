//
//  Order.swift
//  Eagle
//
//  Created by moh on 3/22/21.
//  Copyright © 2021 moh. All rights reserved.
//

import Foundation

struct Cart {
    
    //var Id: String
    var productsId: [String]!
    
    init(dictionary: NSDictionary) {
        productsId = (dictionary["itemsid"] as? [String])
    }
    init() {
    }
    
}
