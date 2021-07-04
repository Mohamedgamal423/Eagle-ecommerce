//
//  Imagecell.swift
//  Eagle
//
//  Created by moh on 2/14/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit
import FirebaseAuth
import JGProgressHUD

class Imagecell: UITableViewCell {

    @IBOutlet weak var imgview: UIImageView!
    var id: String!
    var hud = JGProgressHUD(style: .dark)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
    }
    @IBAction func favBtn(_ sender: Any) {
        let uid = Auth.auth().currentUser?.uid
        Dataservice.instance.downloadFavour(uid: uid!) { (idsarr) in
            if var ids = idsarr {
                ids.append(self.id)
                Dataservice.instance.updateFavour(uid: uid!, prodIds: ids)
                self.showHudprogress(text: "Added to favourites")
            }
            else {
                Dataservice.instance.saveFavour(uid: uid!, Ids: [self.id])
                self.showHudprogress(text: "Added to favourites")
            }
        }
    }
    func showHudprogress(text: String) {
        self.hud.textLabel.text = text
        self.hud.indicatorView = JGProgressHUDSuccessIndicatorView()
        self.hud.show(in: self.contentView)
        self.hud.dismiss(afterDelay: 2.0)
    }
    func downloadimages() {
        
    }

    

}
