//
//  VC.swift
//  Eagle
//
//  Created by moh on 3/22/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit


//class VC: UIViewController {
//
//    @IBOutlet weak var titletxt: UITextField!
//    @IBOutlet weak var desctxt: UITextView!
//    @IBOutlet weak var colortxt: UITextField!
//    @IBOutlet weak var sizetxt: UITextField!
//
//    //let ref = Storage.storage().reference().child("images/pantcat")
//    var categories = [Category]()
//    var imurlarr = [String]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//
//        Dataservice.instance.saveProductimages(imagesarr: ["51","52","53","54"]) { (saved) in
//            if saved {
//                print("saved images")
//            }
//        }
//    }
//    func printurl() {
//        for url in imurlarr {
//            print(url)
//        }
//    }
//
//    @IBAction func Btontap() {
//        Dataservice.instance.getimgsurl(imagespath: ["51","52","53","54"]) { (urlarr) in
//            self.imurlarr = urlarr
//        }
//        printurl()
//        if imurlarr != [] {
//
//            Dataservice.instance.saveProduct(Catid: "blFvsPmkLhUSKyKKssQl", title: titletxt.text!, colors: ["blue", "grey", "red", "black"], descrip: desctxt.text!, size: sizetxt.text!, price: Int(colortxt.text!)!, imageurl: imurlarr) { (saved) in
//            if saved {
//                print("saved prod success")
//            }
//            else {
//                print("not saved")
//            }
//        }
//        //let dressproducts = [["11","12","13","14"],["21","22","23","24"],["31","32","33","34"],["41","42","43","44"],["51","52","53","54"]]
//    }
//        else {
//            print("imurlarr is empty")
//        }
//   }
//}
//
//
