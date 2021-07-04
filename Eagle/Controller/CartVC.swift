//
//  CartVC.swift
//  Eagle
//
//  Created by moh on 2/16/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit
import FirebaseAuth
import JGProgressHUD

class CartVC: UIViewController {

    @IBOutlet weak var CartTable: UITableView!
    @IBOutlet weak var checkoutbtn: CustomButton!
    @IBOutlet weak var totprice: UILabel!
    
    var hud = JGProgressHUD(style: .extraLight)
    var prodsids = [String]()
    var products = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()
        CartTable.delegate = self
        CartTable.dataSource = self
        CartTable.isHidden = true
        let nibcell = UINib(nibName: "Cartcell", bundle: nil)
        CartTable.register(nibcell, forCellReuseIdentifier: "cartcell")
        checkoutbtn.makecustomBtn(backgroundcolor: #colorLiteral(red: 0.9607843137, green: 0.6784313725, blue: 0.1411764706, alpha: 1), bordercolor: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if products.count == 0 {
            showHudprogress()
            let uid = Auth.auth().currentUser?.uid
            Dataservice.instance.downloadCart(uid: uid!) { (prodsids) in
                self.prodsids = prodsids!
                self.downloadproducts(ids: prodsids!)
            }
        }
        
    }
    func downloadproducts(ids: [String]) {
        Dataservice.instance.getprodswith(prodids: ids) { (allprods) in
            self.products = allprods
            self.totprice.text = "\(self.gettotalprice())$"
            self.hud.dismiss()
            self.CartTable.isHidden = false
            self.CartTable.reloadData()
        }
    }

    @IBAction func editCartBtn(_ sender: Any) {
        let editvc = storyboard?.instantiateViewController(identifier: "editvc") as! CarteditVC
        editvc.products = products
        navigationController?.pushViewController(editvc, animated: true)
        
    }
    @IBAction func nextCartBtn(_ sender: Any) {
        let infovc = storyboard?.instantiateViewController(identifier: "infovc") as! UserinfoVC
        infovc.productsIds = prodsids
        infovc.price = gettotalprice()
        navigationController?.pushViewController(infovc, animated: true)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    func showHudprogress() {
        //self.hud.textLabel.text = "Added to basket!"
        self.hud.indicatorView = JGProgressHUDIndeterminateIndicatorView()
        self.hud.show(in: self.view)
        //self.hud.dismiss(afterDelay: 2.0)
    }
    func gettotalprice() -> Int {
        var totalprice = 0
        for prod in products {
            totalprice = totalprice + prod.price
        }
        return totalprice
    }
}
extension CartVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cartcell") as? Cartcell else {return UITableViewCell()}
        cell.configurecell(product: products[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
}
