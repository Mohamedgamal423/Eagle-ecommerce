//
//  Categoriescell.swift
//  Eagle
//
//  Created by moh on 2/9/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class Categoriescell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var Catcollection: UICollectionView!
    var delegate: Cellprot?
    var categories = [Category]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Catcollection.dataSource = self
        Catcollection.delegate = self
        let nib = UINib(nibName: "Categoriescollcell", bundle: nil)
        Catcollection.register(nib, forCellWithReuseIdentifier: "cell")
//        Dataservice.instance.getCategories { (cats) in
//            print("number of cats \(cats.count)")
//            self.categories = cats
//            self.Catcollection.reloadData()
//        }
        DispatchQueue.main.async {
            Dataservice.instance.getCategories { (cats) in
                self.categories = cats
                self.Catcollection.reloadData()
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? Categoriescollcell else {return UICollectionViewCell()}
        cell.configurecell(category: categories[indexPath.row])
    
            return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 370, height: 190)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let catid = categories[indexPath.row].id
        delegate?.mn(catid: catid)
        
    }

    
}
protocol Cellprot {
    
    func mn(catid: String)
    func presentitem(product: Product, products: [Product])
    func viewnewimg(image: UIImage)
}
