//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by Luiz Guilherme on 19/05/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import UIKit

class PasswordsViewController: UIViewController {

    @IBOutlet weak var tvPasswords: UITextView!
    
    var numberOfCaracters: Int = 10
    var numberOfPasswords: Int = 1
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCaracters: Bool!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func generate(_ sender: Any) {
    }
    
}
