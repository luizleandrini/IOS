//
//  SecondViewController.swift
//  CicloDeVida
//
//  Created by Luiz Guilherme on 14/05/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoaded")
        
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
    }
    override func viewDidDisappear(_ animated: Bool){
        super.viewDidDisappear(animated)
        print("Tela 1: viewDidDisappear")
    }
    

}
