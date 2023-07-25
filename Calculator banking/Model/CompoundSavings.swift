//
//  CompoundSavings.swift
//  Calculator banking
//
//  Created by admin on 2023/6/7.
//

import Foundation

class CompoundSavings {
    
    var presentValue: Double
    var futureValue : Double
    var interest : Double
    var numberOfYears : Double
    var compoundsPerYear : Int
    var historyStringArray : [String]
    
    init(presentValue: Double, futureValue: Double, interest: Double, numberOfYears: Double, compoundsPerYear : Int) {
        self.presentValue = presentValue
        self.futureValue = futureValue
        self.interest = interest
        self.numberOfYears = numberOfYears
        self.compoundsPerYear = compoundsPerYear
        self.historyStringArray = [String]()
    }
    
    func calculatePresentValue() -> Double {
        let annualInterestRate = self.interest / 100
        let principalValue = self.futureValue / pow(1 + (annualInterestRate / Double(self.compoundsPerYear)), Double(self.compoundsPerYear) * self.numberOfYears)
        
       if principalValue < 0 || principalValue.isNaN || principalValue.isInfinite {
            self.presentValue = 0.0;
            return self.presentValue
        } else {
            self.presentValue = principalValue.roundTo2()
            return self.presentValue
        }
        
    }
    
    func calculateFutureValue() -> Double {
        let annualInterestRate = self.interest / 100
        let futureValue = self.presentValue * pow(1 + (annualInterestRate / Double(self.compoundsPerYear)), Double(self.compoundsPerYear) * self.numberOfYears)
        
        if futureValue < 0 || futureValue.isNaN || futureValue.isInfinite {
            self.futureValue = 0.0;
            return self.futureValue
        } else {
            self.futureValue = futureValue.roundTo2()
            return self.futureValue
        }
        
    }
    
    func calculateCompoundInterestRate() -> Double {
        let interestRate = Double(self.compoundsPerYear) * (pow((self.futureValue / self.presentValue), (1 / (Double(self.compoundsPerYear) * self.numberOfYears))) - 1)
        
        if interestRate < 0 || interestRate.isNaN || interestRate.isInfinite {
            self.interest = 0.0;
            return self.interest
        } else {
            let annualInterestRate = interestRate * 100
            self.interest = annualInterestRate.roundTo2()
            return self.interest
        }
        
        
    }
    
    func calculateNumberOfYears() -> Double {
        let annualInterestRate = self.interest / 100
        let years = log(self.futureValue / self.presentValue) / (Double(self.compoundsPerYear) * log(1 + (annualInterestRate / Double(self.compoundsPerYear))))
        
        if years < 0 || years.isNaN || years.isInfinite {
            self.numberOfYears = 0.0;
            return self.numberOfYears
        } else {
            self.numberOfYears = years.roundTo2()
            return self.numberOfYears
        }
        
        
    }
    
}

