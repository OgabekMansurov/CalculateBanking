//
//  UIViewController+KeyboardListeners.swift
//  Calculator banking
//
//  Created by admin on 2023/6/7.
//

import Foundation
import UIKit

extension UIViewController {
    
    /**
     Listens to keyboard events
     * [Reference](https://www.youtube.com/watch?v=xVZubAMFuIU)
    */
    func addKeyboardEventListeners() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillChange(notification: Notification){}
    
}

