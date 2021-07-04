//
//  PaymentMethodVC.swift
//  Eagle
//
//  Created by moh on 3/5/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class PaymentMethodVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var payments = [PaymentMethod(name: "Mastercard", imagename: "Mastercard icon"),
    PaymentMethod(name: "Visa", imagename: "Visa icon"),
    PaymentMethod(name: "Visa", imagename: "Visa icon")]
    
    @IBOutlet weak var paymentTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paymentTable.delegate = self
        paymentTable.dataSource = self
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Back Button"), style: .plain, target: self, action: #selector(popnav))
        navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 0.1960784314, green: 0.2117647059, blue: 0.262745098, alpha: 1)
        navigationItem.title = "SELECT PAYMENT METHOD"

    }
    
    @objc func popnav() {
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        payments.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "paymentcell") as? PaymentMethodcell else {return UITableViewCell()}
        cell.configurecell(payment: payments[indexPath.row])
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 || indexPath.row == 1 {
            let cartvc = storyboard?.instantiateViewController(identifier: "cart") as! CartinfoVC
            navigationController?.pushViewController(cartvc, animated: true)
        }
    }
    

    

}

