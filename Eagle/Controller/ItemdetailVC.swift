//
//  ItemdetailVC.swift
//  Eagle
//
//  Created by moh on 2/13/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class ItemdetailVC: UIViewController, UITableViewDataSource, UITableViewDelegate, Cellprot {
    
    @IBOutlet weak var itemTable: UITableView!
    var selectedpro: Product!
    var alsoprods = [Product]()
    var selectedimg: UIImage!
    var row = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemTable.delegate = self
        itemTable.dataSource = self
        let nibdet = UINib(nibName: "Detailcell", bundle: nil)
        itemTable.register(nibdet, forCellReuseIdentifier: "detcell")
        let imgcell = UINib(nibName: "Photoscell", bundle: nil)
        itemTable.register(imgcell, forCellReuseIdentifier: "pht")
        let alsonib = UINib(nibName: "Seealsocell", bundle: nil)
        itemTable.register(alsonib, forCellReuseIdentifier: "alcell")
        let headnib = UINib(nibName: "Headerview", bundle: nil)
        itemTable.register(headnib, forHeaderFooterViewReuseIdentifier: "heado")
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1960784314, green: 0.2117647059, blue: 0.262745098, alpha: 1)
        navigationItem.title = "ITEM DETAIL"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Back Button"), style: .plain, target: self, action: #selector(popnav))
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        downloadimages()
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.popViewController(animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "imcell") as? Imagecell else {return UITableViewCell()}
            if selectedimg != nil {
                cell.imgview.image = selectedimg
                cell.id = selectedpro.id
            }
            else {
                cell.imgview.image = selectedpro.images[0]
                cell.id = selectedpro.id
            }
            return cell
        }
        else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "detcell") as? Detailcell else {return UITableViewCell()}
            cell.configurecell(product: selectedpro)
            return cell
        }
        else if indexPath.section == 2 {

            guard let cell = tableView.dequeueReusableCell(withIdentifier: "pht") as? Photoscell else {return UITableViewCell()}
            cell.delegate = self
            cell.product = selectedpro
            cell.collectionview.reloadData()
            return cell
        }
       else if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "alcell") as? Seealsocell else {return UITableViewCell()}
            cell.delegate = self
            cell.products = alsoprods
            cell.collview.reloadData()
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            row = indexPath.section
            return 400
        }
        else if indexPath.section == 1 {
            row = indexPath.section
            return 360
        }
        else if indexPath.section == 2 {
            row = indexPath.section
            return 150
        }
        else {
            row = indexPath.section
            return 400
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "heado") as? Headerview else {return UITableViewHeaderFooterView()}
        if section == 2 {
            header.title.text = "Photos"
            header.viewmoBtn.isHidden = true
            return header
        }
        else if section == 3 {
            header.title.text = "You May Like"
            header.viewmoBtn.isHidden = true
            return header
        }
        else {
            return nil
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section==0 || section == 1 {
            return CGFloat.leastNonzeroMagnitude
        }
        return 26
    }
    @objc func popnav() {
        navigationController?.popViewController(animated: true)
    }
    func mn(catid: String) {
        print("hello")
    }
    
    func presentitem(product: Product, products: [Product]) {
        self.selectedimg = nil
        self.selectedpro = product
        self.alsoprods = products
        self.itemTable.reloadData()
        self.itemTable.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
    }
    func viewnewimg(image: UIImage) {
        self.selectedimg = image
        self.itemTable.reloadData()
    }
    func downloadimages() {
        for (index, url) in selectedpro.imagesurls.enumerated() {
            if index == 0 {
                continue
            }
            let imurl = URL(string: url)
            DispatchQueue.main.async {
              guard let imdata = NSData(contentsOf: imurl!)  else {return}
              let image = UIImage(data: imdata as Data)
              self.selectedpro.images.append(image!)
                if self.selectedpro.images.count == self.selectedpro.imagesurls.count {
                    print("downloaded all images success")
                }
            }
        }
    }

}
