//
//  Categcell.swift
//  Eagle
//
//  Created by moh on 3/13/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class Photoscell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionview: UICollectionView!
    var product: Product!
    var delegate: Cellprot?
    override func awakeFromNib() {
        collectionview.delegate = self
        collectionview.dataSource = self
        let nib = UINib(nibName: "Photoscollcell", bundle: nil)
        collectionview.register(nib, forCellWithReuseIdentifier: "photo")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photo", for: indexPath) as? Photoscollcell else {return UICollectionViewCell()}
        cell.configurecell(image: product.images[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.viewnewimg(image: product.images[indexPath.row])
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 103, height: 80)
    }

}
