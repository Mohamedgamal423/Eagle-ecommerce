//
//  CarteditVC.swift
//  Eagle
//
//  Created by moh on 2/22/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class CarteditVC: UIViewController {

    @IBOutlet weak var cartedittable: UITableView!
    @IBOutlet weak var donebtn: CustomButton!
    @IBOutlet weak var deletebtn: CustomButton!
    @IBOutlet weak var totalprice: UILabel!
    var products: [Product]!
    var selectedindex: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartedittable.delegate = self
        cartedittable.dataSource = self
        deletebtn.makecustomBtn(backgroundcolor: .white, bordercolor: #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1))
        donebtn.makecustomBtn(backgroundcolor: #colorLiteral(red: 0.9607843137, green: 0.6784313725, blue: 0.1411764706, alpha: 1), bordercolor: nil)
        let nibo = UINib(nibName: "CarteditCell", bundle: nil)
        cartedittable.register(nibo, forCellReuseIdentifier: "editcell")
        totalprice.text = "50$"
        deletebtn.isHidden = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Back Button"), style: .plain, target: self, action: #selector(popnav))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "x"), style: .plain, target: self, action: #selector(popnav))
        navigationItem.title = "CART"
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
       //products = File.instance.getproducts()
    }
    
    @objc func popnav() {
        navigationController?.popViewController(animated: true)
    }
    
//    @IBAction func deleteBtn(_ sender: Any) {
//        //File.instance.removeProduct(index: selectedindex.row)
//        cartedittable.deleteRows(at: [selectedindex], with: .automatic)
//        products.remove(at: selectedindex.row)
//        cartedittable.reloadData()
//
//    }
    
    @IBAction func doneBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
extension CarteditVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let editcell = tableView.dequeueReusableCell(withIdentifier: "editcell") as? CarteditCell else { return UITableViewCell()}
        editcell.configurecell(product: products[indexPath.row])
        return editcell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedindex = indexPath
        deletebtn.isHidden = false
        //deletebtn.addTarget(self, action: #selector(delete(_:)), for: .touchUpInside)
        
    }
//    @objc func delete(indexpath: IndexPath) {
//        products.remove(at: indexpath.row)
//        cartedittable.deleteRows(at: [selectedindex], with: .automatic)
//        //cartedittable.reloadData()
//    }
    
}
