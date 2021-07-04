//
//  Menulist.swift
//  Eagle
//
//  Created by moh on 3/19/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit

class Menulist: UITableViewController {
    
    var items = ["COMPLETED ORDERS", "MY ADDRESS", "COUNTRY", "PRIVACY POLICY", "TERMS & CONDITIONS"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.selectionStyle = .none
        cell?.textLabel?.text = items[indexPath.row]
        return cell!
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            guard let vc = storyboard?.instantiateViewController(identifier: "cu") as? CountryVC else {return}
            self.present(vc, animated: true, completion: nil)
        }
        
    }
}
