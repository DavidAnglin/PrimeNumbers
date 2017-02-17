//
//  PrimeNumberViewController.swift
//  PrimeNumbers
//
//  Created by David Anglin on 2/16/17.
//  Copyright © 2017 David Anglin. All rights reserved.
//

import UIKit

class PrimeNumberViewController: UIViewController {

    var primeNumberToShow: Int!
    
    @IBOutlet weak var primeNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        primeNumber.text = String(primeNumberToShow)
    }
}
