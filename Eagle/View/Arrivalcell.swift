//
//  Arrivalcell.swift
//  Eagle
//
//  Created by moh on 3/13/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class Arrivalcell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collview: UICollectionView!
    var delegate: Cellprot?
    var products = [Product]()
    
    override func awakeFromNib() {
        collview.delegate = self
        collview.dataSource = self
        let nib = UINib(nibName: "Arrivalcollcell", bundle: nil)
        collview.register(nib, forCellWithReuseIdentifier: "arr")
        Dataservice.instance.getProducts { (reprods) in
            self.products = reprods
            self.collview.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count - 2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "arr", for: indexPath) as? Arrivalcollcell else {return UICollectionViewCell()}
        cell.configurecell(product: products[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.presentitem(product: products[indexPath.row], products: products)
    }
    
    
}
