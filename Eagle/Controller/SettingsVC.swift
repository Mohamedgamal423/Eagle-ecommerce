//
//  SettingsVC.swift
//  Eagle
//
//  Created by moh on 3/9/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit
import SideMenu


class SettingsVC: UIViewController {
    
    @IBOutlet weak var table:UITableView!
    
    var data = [["MY ORDERS", "EDIT PROFILE", "MY ADDRESSS"], ["PRIVACY POLICY", "TERMAS AND CONDITIONS"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        navigationItem.title = "SETTINGS"
    }

}
extension SettingsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return data[0].count
        }
        return data[1].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        cell.textLabel?.font.withSize(12)
        cell.textLabel?.textColor = #colorLiteral(red: 0.1960784314, green: 0.2117647059, blue: 0.262745098, alpha: 1)
        cell.textLabel?.textAlignment = .left
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UITableViewHeaderFooterView()
        if section == 0 {
            header.backgroundColor = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
        }
        header.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 1
        }
        return 10
    }
    
}

