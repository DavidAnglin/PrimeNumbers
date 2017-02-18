//
//  UIViewController+DismissKeyboard.swift
//  PrimeNumbers
//
//  Created by David Anglin on 2/18/17.
//  Copyright © 2017 David Anglin. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
