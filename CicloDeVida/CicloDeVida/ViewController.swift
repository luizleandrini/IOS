//
//  ViewController.swift
//  CicloDeVida
//
//  Created by Luiz Guilherme on 14/05/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Tela 1: viewDidLoaded")
        label.text = "Entre com seu nome"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Tela 1: ViewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Tela 1: ViewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Tela 1: ViewWillDesappear")
        label.text = textfield.text
    }
    override func viewDidDisappear(_ animated: Bool){
        super.viewDidDisappear(animated)
        print("Tela 1: viewDidDisappear")
    }
    

}

