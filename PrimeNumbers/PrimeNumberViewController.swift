//
//  PrimeNumberViewController.swift
//  PrimeNumbers
//
//  Created by David Anglin on 2/16/17.
//  Copyright © 2017 David Anglin. All rights reserved.
//

import UIKit

class PrimeNumberViewController: UIViewController {

    // MARK: - Public Variable -
    var primeNumberToShow: Int!
    
    // MARK: - IBOutlets -
    @IBOutlet weak var primeNumber: UILabel!
    
    // MARK: - View Controller Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        primeNumber.text = String(primeNumberToShow)
    }
}
