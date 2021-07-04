//
//  CarteditCell.swift
//  Eagle
//
//  Created by moh on 2/19/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class CarteditCell: UITableViewCell {

    @IBOutlet weak var img: CustomImgview!
    @IBOutlet weak var selectimg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var sizestack: UIStackView!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        // Initialization code
    }
    func configurecell(product: Product) {
        emptystack()
        img.image = product.images[0]
        name.text = product.title
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
            b.backgroundColor = UIColor.clear
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
        if selected {
            selectimg.image = UIImage(named: "ac")
        }
        else {
            selectimg.image = UIImage(named: "Select")
        }
        //selectimg.image = UIImage(named: "ac")
    }
    
}
