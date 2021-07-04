//
//  PaymentMethod.swift
//  Eagle
//
//  Created by moh on 3/5/21.
//  Copyright © 2021 moh. All rights reserved.
//

import Foundation

struct PaymentMethod {
    
    private(set) var name: String
    private(set) var imagename: String
    
    init(name: String, imagename: String) {
        self.name = name
        self.imagename = imagename
    }
}
