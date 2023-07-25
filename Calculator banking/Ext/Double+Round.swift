//
//  Double+Round.swift
//  Calculator banking
//
//  Created by admin on 2023/6/7.
//

import Foundation
import UIKit

extension Double {
    
    func roundTo2() -> Double {
        let divisor = pow(10.0, 2.0)
        let rounded = (self * divisor).rounded() / divisor
        return rounded
    }
    
    
}

