//
//  CheckoutVC.swift
//  Eagle
//
//  Created by moh on 3/5/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class CheckoutVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var checkTabl: UITableView!
    @IBOutlet weak var nextBtn: CustomButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        checkTabl.delegate = self
        checkTabl.dataSource = self
        nextBtn.makecustomBtn(backgroundcolor: #colorLiteral(red: 0.9607843137, green: 0.6784313725, blue: 0.1411764706, alpha: 1), bordercolor: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Back Button"), style: .plain, target: self, action: #selector(popnav))
        navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 0.1960784314, green: 0.2117647059, blue: 0.262745098, alpha: 1)
        navigationItem.title = "YOUR ORDER"
    }
    
    @objc func popnav() {
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "info") as? Infocell else {return UITableViewCell()}
            return cell
        }
        else if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "delivery") as? Deliverychcell else {return UITableViewCell()}
            return cell
        }
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "payment") as? Paymentchcell else {return UITableViewCell()}
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 127
        }
        return 105
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let deliveryvc = storyboard?.instantiateViewController(identifier: "delivery") as! DeliveryVC
            navigationController?.pushViewController(deliveryvc, animated: true)
        }
        else if indexPath.row == 2 {
            let payvc = storyboard?.instantiateViewController(identifier: "pmethod") as! PaymentMethodVC
            navigationController?.pushViewController(payvc, animated: true)
        }
    }
    
}
