//
//  TaxesCalculator.swift
//  ComprasUSA
//
//  Created by Luiz Guilherme on 01/06/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import Foundation

class TaxesCalculator{
    static let shared = TaxesCalculator()
    var dolar: Double = 5.3
    var iof: Double = 6.38
    var stateTax: Double = 7.0
    var shoppingValue: Double = 0
    
    let formatter = NumberFormatter()
    
    var shoppingValueInReal: Double {
        return shoppingValue * dolar
    }
    
    var stateTaxValue: Double {
        return shoppingValue * stateTax/100
    }
    
    var iofValue: Double {
        return (shoppingValue + stateTax) * iof/100
    }
    
    func calculate(usingCreditCard: Bool) -> Double{
        var finalValue = shoppingValue + stateTax
        if usingCreditCard{
            finalValue += iofValue
        }
        return finalValue * dolar
    }
    
    func convertToDouble(string: String) -> Double{
        formatter.numberStyle = .none
        return formatter.number(from: string)!.doubleValue
    }
    
    func getFormattedValue(of value: Double, withCurrency currency:String) -> String {
        formatter.numberStyle = .currency
        formatter.currencySymbol = currency
        formatter.alwaysShowsDecimalSeparator = true
        return formatter.string(for: value)!
    }
    
    private init(){
        formatter.usesGroupingSeparator = true
    }
    
}
