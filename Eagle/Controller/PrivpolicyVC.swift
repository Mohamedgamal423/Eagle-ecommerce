//
//  PrivpolicyVC.swift
//  Eagle
//
//  Created by moh on 4/24/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit
import WebKit
import FirebaseAuth

class PrivpolicyVC: UIViewController, WKNavigationDelegate {

    var webview: WKWebView!
    var products: [Product]!
//    override func loadView() {
//
//        let conf = WKWebViewConfiguration()
//        webview = WKWebView(frame: .zero, configuration: conf)
//        webview.navigationDelegate = self
//        view = webview
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("opening url")
//        let url = URL(string: "https://virlpro.online/privacy-policy-2/")
//        let req = URLRequest(url: url!)
//        webview.load(req)
//        webview.allowsBackForwardNavigationGestures = true

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let uid = Auth.auth().currentUser?.uid
        Dataservice.instance.downloadCart(uid: uid!) { (prodids) in
            if let ids = prodids {
                Dataservice.instance.getprodswith(prodids: ids) { (prods) in
                    self.products = prods
                    for item in self.products {
                        print(item.title)
                    }
                    //self.CartTable.reloadData()
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
