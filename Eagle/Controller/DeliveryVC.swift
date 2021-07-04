//
//  DeliveryVC.swift
//  Eagle
//
//  Created by moh on 3/10/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class DeliveryVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var deliveryTable:UITableView!
    @IBOutlet weak var selectBtn:CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deliveryTable.delegate = self
        deliveryTable.dataSource = self
        selectBtn.isHidden = true
        selectBtn.makecustomBtn(backgroundcolor: #colorLiteral(red: 0.9607843137, green: 0.6784313725, blue: 0.1411764706, alpha: 1), bordercolor: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Back Button"), style: .plain, target: self, action: #selector(popnav))
        navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 0.1960784314, green: 0.2117647059, blue: 0.262745098, alpha: 1)
        navigationItem.title = "DELIVERY METHOD"
    }
    
    @objc func popnav() {
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "decell") as! Deliverycell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectBtn.isHidden = false
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
