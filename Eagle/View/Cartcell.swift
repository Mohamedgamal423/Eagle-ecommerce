//
//  Cartcell.swift
//  Eagle
//
//  Created by moh on 2/17/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class Cartcell: UITableViewCell {
    
    @IBOutlet weak var img: CustomImgview!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var sizestack: UIStackView!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configurecell(product: Product) {
        emptystack()
        img.image = product.images.first
        title.text = product.title
        color.text = product.colors[0]
        add(sizes: product.size)
        price.text = "\(product.price)$"
        
    }
    func add(sizes: [String]) {
        
        for item in sizes {
            let button = UIButton()
            _ = button.widthAnchor.constraint(equalToConstant: 10).isActive = true
            _ = button.heightAnchor.constraint(equalToConstant: 10).isActive = true
            //self.contentView.addConstraints([widthtcons, heightcons])
            button.setTitle(item, for: .normal)
            button.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 10)
            button.backgroundColor = UIColor.clear
            button.addTarget(self, action: #selector(button1(_:)), for: .touchUpInside)
            sizestack.addArrangedSubview(button)
        }
    }
    @objc func button1(_ sender: UIButton) {
        let buttons =  sizestack.arrangedSubviews as! [UIButton]
        buttons.forEach { (b) in
            b.setTitleColor(.black, for: .normal)
            b.backgroundColor = UIColor.red
        }
        sender.setTitleColor(.orange, for: .normal)
        //sender.backgroundColor = UIColor.red
    
    }
    func emptystack() {
        for item in sizestack.arrangedSubviews {
            sizestack.removeArrangedSubview(item)
        }
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
