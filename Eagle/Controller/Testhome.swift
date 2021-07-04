//
//  Testhome.swift
//  Eagle
//
//  Created by moh on 3/14/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource, Cellprot {
    
    @IBOutlet weak var hometable: UITableView!
    
    var selectedprod: Product?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        hometable.delegate = self
        hometable.dataSource = self
        let catnib = UINib(nibName: "Categoriescell", bundle: nil)
        hometable.register(catnib, forCellReuseIdentifier: "cacell")
        let arrivalnib = UINib(nibName: "Arrivalcell", bundle: nil)
        hometable.register(arrivalnib, forCellReuseIdentifier: "arcell")
        let bestnib = UINib(nibName: "Bestsellercell", bundle: nil)
        hometable.register(bestnib, forCellReuseIdentifier: "becell")
        let headnib = UINib(nibName: "Headerview", bundle: nil)
        hometable.register(headnib, forHeaderFooterViewReuseIdentifier: "head")
//        Dataservice.instance.getbestproducts { (products) in
//            print("number of products is \(products.count)")
//        }
//        Dataservice.instance.getCategories { (cats) in
//            print("number of categories is \(cats.count)")
//        }
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            guard let cell = hometable.dequeueReusableCell(withIdentifier: "cacell") as? Categoriescell else {return UITableViewCell()}
            cell.delegate = self
            return cell
        }
        else if indexPath.section == 1 {
            guard let cell = hometable.dequeueReusableCell(withIdentifier: "arcell") as? Arrivalcell else {return UITableViewCell()}
            cell.delegate = self
            return cell
        }
        else {
            guard let cell = hometable.dequeueReusableCell(withIdentifier: "becell") as? Bestsellercell else {return UITableViewCell()}
            cell.delegate = self
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 350
        }
        else {
            return 300
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 1 {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "head") as? Headerview else {return UITableViewHeaderFooterView()}
            header.title.text = "New Arrivals"
            header.delegate = self
        return header
        }
        else if section == 2 {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "head") as? Headerview else {return UITableViewHeaderFooterView()}
            header.title.text = "Best Seller"
            header.delegate = self
        return header
        }
        else {
            return nil
        }
        
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat.leastNonzeroMagnitude
        }
        else {
            return 26
        }
    }
    
    func mn(catid: String) {
        guard let openvc = storyboard?.instantiateViewController(identifier: "open") as? CategoriesopenVC else {return}
        Dataservice.instance.getprods(forCatid: catid) { (prods) in
            openvc.products = prods
            openvc.Catcolv.reloadData()
        }
        navigationController?.pushViewController(openvc, animated: true)
    }
    func presentitem(product: Product, products: [Product]) {
        guard let Itemvc = storyboard?.instantiateViewController(identifier: "item") as? ItemdetailVC else {return}
        Itemvc.selectedpro = product
        Itemvc.alsoprods = products
        navigationController?.pushViewController(Itemvc, animated: true)
        
    }
    func viewnewimg(image: UIImage) {
        
    }
    
}

