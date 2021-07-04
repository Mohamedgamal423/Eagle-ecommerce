//
//  CountryVC.swift
//  Eagle
//
//  Created by moh on 3/9/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit


class CountryVC: UIViewController {

    @IBOutlet weak var countryTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        countryTable.delegate = self
        countryTable.dataSource = self
    }
    
}
extension CountryVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
