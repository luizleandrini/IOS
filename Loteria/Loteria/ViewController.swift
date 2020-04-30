//
//  ViewController.swift
//  Loteria
//
//  Created by Luiz Guilherme on 30/04/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbGameType: UILabel!
    @IBOutlet weak var scGameType: UISegmentedControl!
    @IBOutlet var balls: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func generateGame() {
    }
    
}

