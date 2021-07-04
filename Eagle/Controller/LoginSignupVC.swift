//
//  ViewController.swift
//  Eagle
//
//  Created by moh on 2/2/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class LoginSignupVC: UIViewController {

    @IBOutlet weak var Collectionview: UICollectionView!
    @IBOutlet weak var LogBtn: CustomButton!
    @IBOutlet weak var SignupBtn: CustomButton!
    @IBOutlet weak var pagecontrol: UIPageControl!
    
    let imagesarr = ["6u6", "jk", "yt", "rt", "ui"]
    var timer: Timer?
    var beginindex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Collectionview.delegate = self
        self.Collectionview.dataSource = self
        LogBtn.defaultsetup()
        SignupBtn.makewhiteBtn()
        timer = Timer(timeInterval: 2.5, target: self, selector: #selector(makeslider), userInfo: nil, repeats: true)
        
    }
    @IBAction func logBtn(_ sender: Any) {
        
    }
    @IBAction func signupBtn(_ sender: Any) {
        
    }
    
    @objc func makeslider() {
//        if beginindex < imagesarr.count - 1 {
//            beginindex += 1
//        }
//        else {
//            beginindex = 0
//        }
        beginindex += 1
        Collectionview.scrollToItem(at: IndexPath(item: beginindex, section: 0), at: .centeredHorizontally, animated: true)
        //pagecontrol.currentPage = beginindex
        
    }
    
    


}
extension LoginSignupVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesarr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collcell = collectionView.dequeueReusableCell(withReuseIdentifier: "slidercell", for: indexPath) as? Collviewslidercell else { return UICollectionViewCell() }
        collcell.imgview.image = UIImage(named: imagesarr[indexPath.row])
        return collcell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 230, height: 230)
    }
    
    
    
}

