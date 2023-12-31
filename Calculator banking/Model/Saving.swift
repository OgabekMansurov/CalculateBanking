//
//  Saving.swift
//  Calculator banking
//
//  Created by admin on 2023/6/8.
//

import Foundation

class Savings {
    
    var principalAmount: Double
    var interest : Double
    var payment : Double
    var compoundsPerYear : Int
    var paymentsPerYear : Int
    var futureValue : Double
    var totalNumberOfPayments: Int
    var historyStringArray : [String]
    
    
    init(principalAmount: Double, interest: Double, payment: Double, compoundsPerYear: Int, paymentsPerYear: Int, futureValue: Double, totalNumberOfPayments: Int) {
        self.principalAmount = principalAmount
        self.interest = interest
        self.payment = payment
        self.compoundsPerYear = compoundsPerYear
        self.paymentsPerYear = paymentsPerYear
        self.futureValue = futureValue
        self.totalNumberOfPayments = totalNumberOfPayments
        self.historyStringArray = [String]()
    }
    
    /**
     Calculates end current savings value
     * annual_interest_rate (in decimal) = yearly_interest_rate / 100
     * number_of_years = number_of_payments / 12
     * current_principal_value  = (future_value - (monthly_deposit * ((pow((1 + annual_interest_rate/compounds_per_year), (compounds_per_year*numberOfYears)) - 1) / (annual_interest_rate/compounds_per_year)))) / (pow(1+(annual_interest_rate/compounds_per_year), (compounds_per_year*numberOfYears)))
     * Reference : Coursework Document
     */
    func calculateEndPrincipalAmount() -> Double {
        let decimalInterest = self.interest/100
        let numberOfYears = Double(self.totalNumberOfPayments)/12
        let compounds = Double(self.compoundsPerYear)
        let principal = (self.futureValue - (self.payment * ((pow((1 + decimalInterest/compounds), (compounds*numberOfYears)) - 1) / (decimalInterest/compounds)))) / (pow(1+(decimalInterest/compounds), (compounds*numberOfYears)))
        
        if principal < 0 || principal.isNaN || principal.isInfinite {
            self.principalAmount = 0;
            return self.principalAmount
        } else {
            self.principalAmount = principal.roundTo2()
            return self.principalAmount
        }
        
    }
    
    func calculateBeginningPrincipalAmount() -> Double {
        let decimalInterest = self.interest/100
        let numberOfYears = Double(self.totalNumberOfPayments)/12
        let compounds = Double(self.compoundsPerYear)
        let principal = (self.futureValue - (self.payment * ((pow((1 + decimalInterest/compounds), (compounds*numberOfYears)) - 1) / (decimalInterest/compounds)) * (1 + (decimalInterest/compounds)))) / (pow(1+(decimalInterest/compounds), (compounds*numberOfYears)))
        
        if principal < 0 || principal.isNaN || principal.isInfinite {
            self.principalAmount = 0;
            return self.principalAmount
        } else {
            self.principalAmount = principal.roundTo2()
            return self.principalAmount
        }
        
    }
    
    func calculateEndPayment() -> Double {
        let decimalInterest = self.interest/100
        let numberOfYears = Double(self.totalNumberOfPayments)/12
        let compounds = Double(self.compoundsPerYear)
        let pmt = (self.futureValue - (self.principalAmount * (pow(1+(decimalInterest/compounds), (compounds*numberOfYears))))) / ((pow((1 + decimalInterest/compounds), (compounds*numberOfYears)) - 1) / (decimalInterest/compounds))
        
        if pmt < 0 || pmt.isNaN || pmt.isInfinite {
            self.payment = 0;
            return self.payment
        } else {
            self.payment = pmt.roundTo2()
            return self.payment
        }
    }
    
    func calculateBeginningPayment() -> Double {
        let decimalInterest = self.interest/100
        let numberOfYears = Double(self.totalNumberOfPayments)/12
        let compounds = Double(self.compoundsPerYear)
        let pmt = (self.futureValue - (self.principalAmount * (pow(1+(decimalInterest/compounds), (compounds*numberOfYears))))) / (((pow((1 + decimalInterest/compounds), (compounds*numberOfYears)) - 1) / (decimalInterest/compounds)) * (1 + (decimalInterest/compounds)))
        
        if pmt < 0 || pmt.isNaN || pmt.isInfinite {
            self.payment = 0;
            return self.payment
        } else {
            self.payment = pmt.roundTo2()
            return self.payment
        }
    }
    

    func calculateEndFutureValue() -> Double {
        let decimalInterest = self.interest/100
        let numberOfYears = Double(self.totalNumberOfPayments)/12
        let compounds = Double(self.compoundsPerYear)
        let a = (self.principalAmount * (pow(1+(decimalInterest/compounds), (compounds*numberOfYears)))) + (self.payment * ((pow((1 + decimalInterest/compounds), (compounds*numberOfYears)) - 1) / (decimalInterest/compounds)))
        
        if a < 0 || a.isNaN || a.isInfinite {
            self.futureValue = 0;
            return self.futureValue
        } else {
            self.futureValue = a.roundTo2()
            return self.futureValue
        }
    }
    
    func calculateBeginningFutureValue() -> Double {
        let decimalInterest = self.interest/100
        let numberOfYears = Double(self.totalNumberOfPayments)/12
        let compounds = Double(self.compoundsPerYear)
        let a = (self.principalAmount * (pow(1+(decimalInterest/compounds), (compounds*numberOfYears)))) + (self.payment * ((pow((1 + decimalInterest/compounds), (compounds*numberOfYears)) - 1) / (decimalInterest/compounds)) * (1 + (decimalInterest/compounds)))
        
        if a < 0 || a.isNaN || a.isInfinite {
            self.futureValue = 0;
            return self.futureValue
        } else {
            self.futureValue = a.roundTo2()
            return self.futureValue
        }
        
    }
    
    func calculateEndNumberOfPayments() -> Int {
        let decimalInterest = self.interest/100
        let compounds = Double(self.compoundsPerYear)
        let numberOfyears = (log(self.futureValue + ((self.payment*compounds)/decimalInterest)) - log(((decimalInterest*self.principalAmount) + (self.payment*compounds)) / decimalInterest)) / (compounds * log(1+(decimalInterest/compounds)))
        let numberOfPayments = numberOfyears * 12
        
        if numberOfPayments < 0 || numberOfPayments.isNaN || numberOfPayments.isInfinite {
            self.totalNumberOfPayments = 0;
            return self.totalNumberOfPayments
        } else {
            self.totalNumberOfPayments = Int(numberOfPayments.roundTo2())
            return self.totalNumberOfPayments
        }
    }
    
    func calculateBeginningNumberOfPayments() -> Int {
        let decimalInterest = self.interest/100
        let compounds = Double(self.compoundsPerYear)
        let numberOfyears = ((log(self.futureValue + self.payment + ((self.payment * compounds) / decimalInterest)) - log(self.principalAmount + self.payment + ((self.payment * compounds) / decimalInterest))) / (compounds * log(1 + (decimalInterest / compounds))))
        let numberOfPayments = numberOfyears * 12
        
        if numberOfPayments < 0 || numberOfPayments.isNaN || numberOfPayments.isInfinite {
            self.totalNumberOfPayments = 0;
            return self.totalNumberOfPayments
        } else {
            self.totalNumberOfPayments = Int(numberOfPayments.roundTo2())
            return self.totalNumberOfPayments
        }
    }
    
    func calculateInterest() -> Double{
        let numberOfYears = Double(self.totalNumberOfPayments)/12
        let interestRate = Double(self.compoundsPerYear) * (pow((self.futureValue / self.principalAmount), (1 / (Double(self.compoundsPerYear) * numberOfYears))) - 1)
        
        if interestRate < 0 || interestRate.isNaN || interestRate.isInfinite {
            self.interest = 0.0;
            return self.interest
        } else {
            let annualInterestRate = interestRate * 100
            self.interest = annualInterestRate.roundTo2()
            return self.interest
        }
    }
    
    
}

