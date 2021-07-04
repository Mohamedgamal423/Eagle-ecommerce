//
//  FavourVC.swift
//  Eagle
//
//  Created by moh on 5/8/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit
import FirebaseAuth

class FavourVC: CategoriesopenVC {

   // @IBOutlet weak var collview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let uid = Auth.auth().currentUser?.uid
        Dataservice.instance.downloadFavour(uid: uid!) { (prodsids) in
            if prodsids?.count != 0 {
                self.downloadproducts(ids: prodsids!)
            }
        }
    }
    func downloadproducts(ids: [String]) {
        Dataservice.instance.getprodswith(prodids: ids) { (allprods) in
            if allprods.count != 0 {
                self.products = allprods
                 print(self.products.count)
                 self.Catcolv.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return products.count
        //return 0
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Categoriesopencell
        cell.updateviews(product: products[indexPath.row])
        return cell
    }

}

