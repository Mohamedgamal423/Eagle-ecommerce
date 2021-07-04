//
//  CategoriesopenVC.swift
//  Eagle
//
//  Created by moh on 2/6/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class CategoriesopenVC: UIViewController {
    
    @IBOutlet weak var Catcolv: UICollectionView!
    var products = [Product]()
    //var delegate: Cellprot?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(products.count)
        Catcolv.delegate = self
        Catcolv.dataSource = self
    }
}
extension CategoriesopenVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? Categoriesopencell else { return UICollectionViewCell() }
        cell.updateviews(product: products[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        //delegate?.presentitem(product: product, products: products)
        guard let Itemvc = storyboard?.instantiateViewController(identifier: "item") as? ItemdetailVC else {return}
        Itemvc.selectedpro = product
        Itemvc.alsoprods = products
        //Itemvc.itemTable.reloadData()
        navigationController?.pushViewController(Itemvc, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 273)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
    }
    
    
    
}
