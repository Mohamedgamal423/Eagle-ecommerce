//
//  Detailcell.swift
//  Eagle
//
//  Created by moh on 2/13/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit
import FirebaseAuth
import JGProgressHUD

class Detailcell: UITableViewCell {
    
    @IBOutlet weak var addCartBtn: CustomButton!
    @IBOutlet weak var descrip: UITextView!
    @IBOutlet weak var colorBtn: UIButton!
    @IBOutlet weak var sizestack: UIStackView!
    var size: [String]!
    var id: String!
    
    let hud = JGProgressHUD(style: .dark)
    
    override func awakeFromNib() {
        selectionStyle = .none
        emptystack()
        addCartBtn.makecustomBtn(backgroundcolor: .white, bordercolor: .gray)
        //add(sizes: size)
    }
    func configurecell(product: Product) {
        emptystack()
        descrip.text = product.descrip
        size = product.size
        add(sizes: product.size)
        self.id = product.id
    }
    @IBAction func addBtnBasket(_ sender: Any) {
        
        let uid = Auth.auth().currentUser?.uid
        Dataservice.instance.downloadCart(uid: uid!) { (idsarr) in
            if var ids = idsarr {
                ids.append(self.id)
                Dataservice.instance.updateCart(uid: uid!, cartdata: ["itemsid": ids])
                self.showHudprogress()
            }
            else {
                Dataservice.instance.saveCard(uid: uid!, cartdata: ["itemsid": [self.id]])
                self.showHudprogress()
            }
        }
    }
    func add(sizes: [String]) {
        
        for (index, item) in sizes.enumerated() {
            let button = UIButton()
            button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button.layer.borderWidth = 2
            _ = button.widthAnchor.constraint(equalToConstant: 25).isActive = true
            _ = button.heightAnchor.constraint(equalToConstant: 25).isActive = true
            //self.contentView.addConstraints([widthtcons, heightcons])
            button.setTitle(item, for: .normal)
            button.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 13)
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.titleLabel?.minimumScaleFactor = 0.5
            button.backgroundColor = UIColor.gray
            button.addTarget(self, action: #selector(button1(_:)), for: .touchUpInside)
            if index == 0 {
                button.backgroundColor = UIColor.red
            }
            sizestack.addArrangedSubview(button)
        }
    }
    @objc func button1(_ sender: UIButton) {
        let buttons =  sizestack.arrangedSubviews as! [UIButton]
        buttons.forEach { (b) in
            b.backgroundColor = UIColor.gray
        }
        sender.backgroundColor = UIColor.red
    
    }
    
    func emptystack() {
        
        for item in sizestack.arrangedSubviews {
            sizestack.removeArrangedSubview(item)
        }
//        if sizestack.arrangedSubviews.count > 0 {
//            for item in sizestack.arrangedSubviews {
//                sizestack.removeArrangedSubview(item)
//            }
//        }
    }
    func createnewCart(id: String) {
        var cart = Cart()
        cart.productsId = [id]
    }
    func showHudprogress() {
        self.hud.textLabel.text = "Added to basket!"
        self.hud.indicatorView = JGProgressHUDSuccessIndicatorView()
        self.hud.show(in: self.contentView)
        self.hud.dismiss(afterDelay: 2.0)
    }
}
