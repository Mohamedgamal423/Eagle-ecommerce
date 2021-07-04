//
//  UserinfoVC.swift
//  Eagle
//
//  Created by moh on 3/17/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class UserinfoVC: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var zipcode: UITextField!
    @IBOutlet weak var checkoutBtn: CustomButton!
    
    var productsIds: [String]!
    var price: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkoutBtn.makecustomBtn(backgroundcolor: #colorLiteral(red: 0.9607843137, green: 0.6784313725, blue: 0.1411764706, alpha: 1), bordercolor: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Back Button"), style: .plain, target: self, action: #selector(popnav))
        navigationItem.title = "CHECKOUT"
    }
    

    @IBAction func checkBtnclicked(_ sender: Any) {
        
        if name.text != "" && address.text != "" && zipcode.text != "" {
            let checkvc = storyboard?.instantiateViewController(identifier: "check") as! CheckoutVC
            let order = Order(productsIds: productsIds, ownerAddress: [name.text!, address.text!, phone.text!, zipcode.text!], shippingAddress: [], status: "processing", price: price)
            Dataservice.instance.makeorder(order: order) { (completed) in
                if completed {
                    self.navigationController?.pushViewController(checkvc, animated: true)
                }
                else {
                    print("your oreder not saved")
                }
            }
        }
        else {
            print("please fill user info")
        }
    }
    @IBAction func backbtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @objc func popnav() {
        navigationController?.popViewController(animated: true)
    }

}
