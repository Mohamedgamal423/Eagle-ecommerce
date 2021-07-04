//
//  CartinfoVC.swift
//  Eagle
//
//  Created by moh on 3/18/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class CartinfoVC: UIViewController {
    
    @IBOutlet weak var nextBtn: CustomButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.makecustomBtn(backgroundcolor: #colorLiteral(red: 0.9607843137, green: 0.6784313725, blue: 0.1411764706, alpha: 1), bordercolor: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Back Button"), style: .plain, target: self, action: #selector(popnav))
        navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 0.1960784314, green: 0.2117647059, blue: 0.262745098, alpha: 1)
        navigationItem.title = "CARD INFORMATION"
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
       // navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func popnav() {
        navigationController?.popViewController(animated: true)
    }
    
}
