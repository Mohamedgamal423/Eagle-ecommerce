//
//  Bestsellercell.swift
//  Eagle
//
//  Created by moh on 3/13/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class Bestsellercell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var colview: UICollectionView!
    var delegate: Cellprot?
    var products = [Product]()
    
    override func awakeFromNib() {
        colview.delegate = self
        colview.dataSource = self
        let nib = UINib(nibName: "Bestsellercolcell", bundle: nil)
        colview.register(nib, forCellWithReuseIdentifier: "best")
        DispatchQueue.main.async {
            Dataservice.instance.getbestproducts { (products) in
                self.products = products
                self.colview.reloadData()
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count - 2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "best", for: indexPath) as? Bestsellercolcell else {return UICollectionViewCell()}
        cell.configurecell(product: products[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 370, height: 190)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.presentitem(product: products[indexPath.row], products: products)
    }

}
