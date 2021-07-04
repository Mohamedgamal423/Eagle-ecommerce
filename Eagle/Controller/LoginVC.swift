//
//  LoginVC.swift
//  Eagle
//
//  Created by moh on 2/2/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var faceloginbtn: CustomButton!
    @IBOutlet weak var twiterloginbtn: CustomButton!
    @IBOutlet weak var logbtn: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        faceloginbtn.makecustomBtn(backgroundcolor: #colorLiteral(red: 0.2935177684, green: 0.4324832559, blue: 0.6613974571, alpha: 1), bordercolor: nil)
        twiterloginbtn.makecustomBtn(backgroundcolor: #colorLiteral(red: 0, green: 0.6745098039, blue: 0.9294117647, alpha: 1), bordercolor: nil)
        logbtn.makecustomBtn(backgroundcolor: #colorLiteral(red: 0.9607843137, green: 0.6784313725, blue: 0.1411764706, alpha: 1), bordercolor: nil)
    }
    @IBAction func logBtn(_ sender: Any) {
        AuthService.instance.loginUser(email: emailTxt.text!, password: passwordTxt.text!) { (logined, error) in
            if logined {
                self.performSegue(withIdentifier: "tab2", sender: nil)
            }
            else {
                print("not registered user please sign up first")
            }
        }
    }
    @IBAction func faceBtn(_ sender: Any) {
        
    }
    @IBAction func twitterBtn(_ sender: Any) {
        
    }
    
    
    
    

}
