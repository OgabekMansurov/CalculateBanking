//
//  Loan.swift
//  Calculator banking
//
//  Created by admin on 2023/6/7.
//

import Foundation

class Loan {
    
    var loanAmount: Double
    var interest : Double
    var payment : Double
    var numberOfPayments : Int
    var historyStringArray : [String]
    
    init(loanAmount: Double, interest: Double, payment: Double, numberOfPayments: Int) {
        self.loanAmount = loanAmount
        self.interest = interest
        self.payment = payment
        self.numberOfPayments = numberOfPayments
        self.historyStringArray = [String]()
    }
    

    func calculateLoanAmount() -> Double {
        let monthlyInterestRate = self.interest / (12 * 100)
        let loan = (self.payment * (pow((1 + monthlyInterestRate), Double(numberOfPayments)) - 1)) / (monthlyInterestRate * pow((1 + monthlyInterestRate), Double(numberOfPayments)))
        
        if loan < 0 || loan.isNaN || loan.isInfinite {
            self.loanAmount = 0.0;
            return self.loanAmount
        } else {
            self.loanAmount = loan.roundTo2()
            return self.loanAmount
        }
    }
    
    func calculateAnnualInterestRate() -> Double {
        let numberOfMonths = Double(self.numberOfPayments)
        var x = 1 + (((self.payment*numberOfMonths/self.loanAmount) - 1) / 12)
        
        func F(_ x: Double) -> Double {
            let F = self.loanAmount * x * pow(1 + x, numberOfMonths) / (pow(1+x, numberOfMonths) - 1) - self.payment
            return F;
        }
        
        func F_Prime(_ x: Double) -> Double {
            let F_Prime = self.loanAmount * pow(x+1, numberOfMonths-1) * (x * pow(x+1, numberOfMonths) + pow(x+1, numberOfMonths) - (numberOfMonths*x) - x - 1) / pow(pow(x+1, numberOfMonths) - 1, 2)
            return F_Prime
        }
        
        while(abs(F(x)) > Double(0.000001)) {
            x = x - F(x) / F_Prime(x)
        }
        
        let I = Double(12 * x * 100)
        
        if I < 0 || I.isNaN || I.isInfinite {
            self.interest = 0.0;
            return self.interest
        } else {
            self.interest = I.roundTo2()
            return self.interest
        }
    }
    
    func calculateMonthlyPayment() -> Double {
        let monthlyInterestRate = self.interest / (12 * 100)
        let monthlyPayment = (self.loanAmount * monthlyInterestRate) / (1 - (pow((1 + monthlyInterestRate), Double(numberOfPayments) * -1)))
        
        if monthlyPayment < 0 || monthlyPayment.isNaN || monthlyPayment.isInfinite {
            self.payment = 0.0;
            return self.payment
        } else {
            self.payment = monthlyPayment.roundTo2()
            return self.payment
        }
    }
    
    func calculateNumberOfPayments() -> Int {
        let monthlyInterestRate = self.interest / (12 * 100)
        let numberOfMonths = log((self.payment / monthlyInterestRate) / ((self.payment / monthlyInterestRate) - (self.loanAmount))) / log(1 + monthlyInterestRate)
        
        if numberOfMonths < 0 || numberOfMonths.isNaN || numberOfMonths.isInfinite {
            self.numberOfPayments = 0;
            return self.numberOfPayments
        } else {
            self.numberOfPayments = Int(numberOfMonths)
            return self.numberOfPayments
        }
        
        
    }
    
    
    
}

