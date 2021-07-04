//
//  AuthService.swift
//  ingred
//
//  Created by moh on 1/24/20.
//  Copyright © 2021 moh. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    
    static let instance = AuthService()
    
    func SigninUser(withemail email: String, password: String, signincomplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error == nil {
                let uid = (Auth.auth().currentUser?.uid)!
                let userdata: Dictionary<String, String> = ["email": (user?.user.email)!]
                Dataservice.instance.CreateDBuser(uid: uid, userdata: userdata)
                signincomplete(true, nil)
            }
            else {
                signincomplete(false, error)
                return
            }
        }
    }
    func loginUser(email: String, password: String, logincomplete: @escaping (_ status: Bool, _ error: Error? ) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error == nil {
                logincomplete(true, nil)
            }
            else {
                logincomplete(false, error)
                return
            }
        }
    }
}

