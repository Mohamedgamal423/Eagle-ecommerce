//
//  Seealsocell.swift
//  Eagle
//
//  Created by moh on 4/4/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class Seealsocell: Arrivalcell {
    
    override func awakeFromNib() {
       collview.delegate = self
       collview.dataSource = self
       let nib = UINib(nibName: "Arrivalcollcell", bundle: nil)
       collview.register(nib, forCellWithReuseIdentifier: "arr2")
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "arr2", for: indexPath) as? Arrivalcollcell else {return UICollectionViewCell()}
        cell.configurecell(product: products[indexPath.row])
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.presentitem(product: products[indexPath.row], products: products)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
}
