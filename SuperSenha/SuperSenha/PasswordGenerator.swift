//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by Luiz Guilherme on 19/05/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import Foundation

class PasswordGenerator {
    var numberOfCharacters: Int
    var useLetters: Bool
    var useNumbers: Bool
    var useCapitalLetters: Bool
    var useSpecialCaracters: Bool
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let specialCaracters = "!@#$%¨&*()_+`{}<>:;.,~[]´'"
    private let numbers = "0123456789"
    
    init(numberOfCharacters: Int, useLetters: Bool, useNumbers: Bool, useCapitalLetters: Bool, useSpecialCaracters: Bool) {
        
        var numchars = min(numberOfCharacters, 16)
        numchars = max(numberOfCharacters, 1)
        
        self.numberOfCharacters = numchars
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCaracters = useSpecialCaracters
    }
    
    func generate(total: Int) -> [String] {
        passwords.removeAll()
        var universe: String = ""
        
        if useLetters{
            universe += letters
        }
        if useNumbers{
            universe += numbers
        }
        if useSpecialCaracters {
            universe += specialCaracters
        }
        if useCapitalLetters{
            universe += letters.uppercased()
        }
        
        let universeArray = Array(universe)
        while passwords.count < total {
            var password = ""
            
            for _ in 1...numberOfCharacters{
            let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
        }
            password.append(password)
        }
        return passwords
    }
    
}
