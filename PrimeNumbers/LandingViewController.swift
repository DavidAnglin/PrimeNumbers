//
//  LandingViewController.swift
//  PrimeNumbers
//
//  Created by David Anglin on 2/16/17.
//  Copyright © 2017 David Anglin. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    //MARK: - Private Enums -
    enum SegueIdentifiers: String {
        case toPrimeNumberList = "showPrimeList"
        case toPrimeNumberLabel = "showPrimeNumber"
    }
    
    //MARK: - Private Structs -
    fileprivate struct Constants {
        static let validInput = "Please Enter A Valid Number"
    }
    
    fileprivate struct AlertConstants {
        static let warning = "Warning"
        static let warningMessage = "This request might take some time. Do you want to continue?"
        static let yes = "Yes"
        static let no = "No"
    }
    
    //MARK: - Private Computed Properties -
    fileprivate var listNumberInt: Int {
        return Int(listNumberEntry.text!)!
    }
    
    fileprivate var primeNumberIndex: Int {
        return Int(specificNumberEntry.text!)!
    }
    
    //MARK: - Public Variables -
    fileprivate var primeNumberArray = [Int]()
    fileprivate var primeNumber = Int()
    
    //MARK: - IBOutlets -
    @IBOutlet weak private var listNumberEntry: UITextField!
    @IBOutlet weak private var specificNumberEntry: UITextField!
    
    //MARK: - IBActions -
    @IBAction func goToPrimeNumberList(_ sender: UIButton) {
        performSegue(withIdentifier: SegueIdentifiers.toPrimeNumberList.rawValue, sender: self)
    }
    
    @IBAction func goToPrimeNumber(_ sender: UIButton) {
        performSegue(withIdentifier: SegueIdentifiers.toPrimeNumberLabel.rawValue, sender: self)
    }
    
    @IBAction func unwindToLandingPage(segue: UIStoryboardSegue) {}
    
    // MARK: - View Controller Life Cycle Methods -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    // MARK: - Navigation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (identifier == SegueIdentifiers.toPrimeNumberLabel.rawValue) {
            if primeNumber != 0 {
                return true
            } else {
                return false
            }
        }
        return true
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let segueIdentifier = SegueIdentifiers.init(rawValue: segue.identifier!) {
            switch segueIdentifier {
            case .toPrimeNumberList:
                guard validationCheck(input: listNumberEntry) else {
                    showAlert(Constants.validInput)
                    return
                }
                
                
                if (validationCheck(input: listNumberEntry)) {
                    if let dvc = segue.destination as? UINavigationController {
                        let pvc = dvc.topViewController as! PrimeNumberListTableViewController
                        pvc.primeArray = returnPrimeList(number: listNumberInt)
                        listNumberEntry.text = ""
                    }
                } else {
                    showAlert(Constants.validInput)
                }
            case .toPrimeNumberLabel:
                if (validationCheck(input: specificNumberEntry)) {
                    if let dvc = segue.destination as? UINavigationController {
                        let lvc = dvc.topViewController as! PrimeNumberViewController
                        lvc.primeNumberToShow = getPrimeNumber(index: primeNumberIndex)
                        specificNumberEntry.text = ""
                    }
                } else {
                    showAlert(Constants.validInput)
                }
            }
        }
    }
    
    //MARK: - Prime Number Functions -
    fileprivate func returnPrimeList(number: Int) -> [Int] {
        
        if (number >= 2) {
            
            if (primeNumberArray.isEmpty) {
                var primeNumbers = [Int]()
                
                for i in (0 ..< number) {
                    if (isPrime(number: i)) {
                        primeNumbers.append(i)
                    }
                }
                
                primeNumberArray.append(contentsOf: primeNumbers)
                return primeNumberArray.filter{ $0 > 0 }
            } else if (!primeNumberArray.isEmpty){
                guard let lastValue = primeNumberArray.last, lastValue < number else {
                    let partialPrimeArray = primeNumberArray.filter { $0 < number}
                    return partialPrimeArray
                }
                
                var primeNumbersAdded = [Int]()
                
                for i in stride(from: (primeNumberArray.last?.hashValue)! + 1, to: number, by: 1) {
                    primeNumbersAdded.append(i)
                }
                
                for numbersAdded in primeNumbersAdded {
                    if (isPrime(number: numbersAdded)) {
                        primeNumberArray.append(numbersAdded)
                    }
                }
                
                return primeNumberArray.filter{ $0 > 0 }
            }
        } else {
            showAlert("There is no prime numbers less than 2")
        }
        return []
    }
    
    fileprivate func getPrimeNumber(index: Int) -> Int {
        
        if (primeNumberArray.indices.contains(index)) {
            return primeNumberArray[index]
        } else {
            return returnPrimeValueAtIndex(index: index)
        }
    }
    
    //MARK: - Helper Functions -
    fileprivate func returnPrimeValueAtIndex(index: Int) -> Int {
        
        var startValue = Int()
        
        if let lastPrimeNumber = primeNumberArray.last {
            startValue = lastPrimeNumber + 1
        } else {
            startValue = 0
        }
        
        while (primeNumberArray.count <= index) {
            if (isPrime(number: startValue)) {
                primeNumberArray.append(startValue)
            }
            startValue += 1
        }
        return primeNumberArray[index]
    }

    fileprivate func isPrime(number: Int) -> Bool {
        
        guard number > 1 else { return false }
        
        if (number == 2 || number == 3) {
            return true
        }
        
        let max = Int(sqrt(Double(number)))
        
        for n in (2...max) {
            if (number % n == 0) {
                return false
            }
        }
        return true
    }
    
    fileprivate func validationCheck(input: UITextField) -> Bool {
        
        return (input.text != "") ? true : false
    }
}

