//
//  LandingViewController.swift
//  PrimeNumbers
//
//  Created by David Anglin on 2/16/17.
//  Copyright © 2017 David Anglin. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    var primeNumberArray = [Int]()
    var primeNumber = Int()
    
    enum SegueIdentifiers: String {
        case toPrimeNumberList = "showPrimeList"
        case toPrimeNumberLabel = "showPrimeNumber"
    }
    
    @IBOutlet weak private var listNumberEntry: UITextField!
    @IBOutlet weak private var specificNumberEntry: UITextField!
    
    var listNumberInt: Int {
        return Int(listNumberEntry.text!)!
    }
    
    var primeNumberIndex: Int {
        return Int(specificNumberEntry.text!)!
    }
    
    @IBAction func goToPrimeNumberList(_ sender: UIButton) {
        primeNumberArray = calculatePrime(n: listNumberInt)
    }
    
    @IBAction func goToPrimeNumber(_ sender: UIButton) {
        primeNumber = getPrimeNumber(index: primeNumberIndex)
    }
    
    @IBAction func unwindToLandingPage(segue: UIStoryboardSegue) {}
 
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let segueIdentifier = SegueIdentifiers.init(rawValue: segue.identifier!) {
            switch segueIdentifier {
            case .toPrimeNumberList:
                if let dvc = segue.destination as? UINavigationController {
                    let pvc = dvc.topViewController as! PrimeNumberListTableViewController
                    pvc.primeArray = primeNumberArray
                }
            case .toPrimeNumberLabel:
                if let dvc = segue.destination as? UINavigationController {
                    let lvc = dvc.topViewController as! PrimeNumberViewController
                    lvc.primeNumberToShow = primeNumber
                }
            }
        }
    }
    
    func calculatePrime(n: Int) -> [Int] {
//        var primeNumbers = [Int](2 ..< number)
//        
//            for i in 0 ..< number - 2 {
//                let primeNumberIndex = primeNumbers[i]
//                if primeNumberIndex > 0 {
//                    for possible in stride(from: 2 * primeNumberIndex - 2, to: number - 2, by: primeNumberIndex) {
//                        primeNumbers[possible] = 0
//                    }
//                }
//                return primeNumbers.filter{ $0 > 0 }
//            }
////        } else {
////            showAlert("There is no prime numbers less than 2")
////        }
//        return []
        
        var numbers = [Int](2 ..< n)
        for i in 0..<n - 2 {
            let prime = numbers[i]
            guard prime > 0 else { continue }
            for multiple in stride(from: 2 * prime - 2, to: n - 2, by: prime){
                numbers[multiple] = 0
            }
        }
        return numbers.filter{ $0 > 0 }
    }
    
    func getPrimeNumber(index: Int) -> Int {
        if (primeNumberArray.count < index) {
            
            
        }
        return 0
    }
}
