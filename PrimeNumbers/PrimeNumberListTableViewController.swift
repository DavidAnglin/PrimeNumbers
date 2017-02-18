//
//  PrimeNumberListTableViewController.swift
//  PrimeNumbers
//
//  Created by David Anglin on 2/16/17.
//  Copyright © 2017 David Anglin. All rights reserved.
//

import UIKit

class PrimeNumberListTableViewController: UITableViewController {
    
    // MARK: - Public Variable -
    var primeArray: [Int]!

    // MARK: - Table view data source -
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return primeArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "primeNumberCell", for: indexPath) as? PrimeNumberTableViewCell
        cell?.primeNumber.text = String(primeArray[indexPath.row])
        
        return cell!
    }
}
