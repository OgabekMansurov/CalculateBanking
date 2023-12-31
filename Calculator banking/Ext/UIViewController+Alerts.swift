//
//  UIViewController+Alerts.swift
//  Calculator banking
//
//  Created by admin on 2023/6/7.
//

import Foundation
import UIKit

extension UIViewController {
    
    /**
     Shows an alert message
     * [Reference](https://stackoverflow.com/questions/24022479/how-would-i-create-a-uialertview-in-swift/51876884#51876884)
    */
    func showAlert(title: String, msg: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}

