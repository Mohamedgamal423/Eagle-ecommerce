//
//  SignupVC.swift
//  Eagle
//
//  Created by moh on 2/2/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confirmpasswordTxt: UITextField!
    @IBOutlet weak var signbtn: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signbtn.makecustomBtn(backgroundcolor: .white, bordercolor: #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1))
    }
    @IBAction func signBtn(_ sender: Any) {
        if emailTxt.text != nil && passwordTxt.text != nil {
            guard passwordTxt.text == confirmpasswordTxt.text
            else {
                print("not equalied passwords")
                return
            }
        }
        AuthService.instance.SigninUser(withemail: emailTxt.text!, password: passwordTxt.text!) { (signed, error) in
            if signed {
                AuthService.instance.loginUser(email: self.emailTxt.text!, password: self.passwordTxt.text!) { (logined, err) in
                    if logined {
                        print("logined success")
                        self.performSegue(withIdentifier: "tab", sender: nil)
                    }
                }
            }
            else  {
                print(error!)
            }
            
        }
    }

}
