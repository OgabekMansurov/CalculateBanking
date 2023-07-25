//
//  UITextField+Validations.swift
//  Calculator banking
//
//  Created by admin on 2023/6/7.
//

import Foundation
import UIKit

extension UITextField {
    
    /// Checks if the text field is empty
    func checkIfEmpty() -> Bool{
        if self.text!.count > 0 {
            return false
        } else {
            return true
        }
    }
    
}
