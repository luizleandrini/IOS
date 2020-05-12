//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Luiz Guilherme on 12/05/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var lbAnswer: UILabel!
    @IBOutlet weak var lbCorrect: UILabel!
    @IBOutlet weak var lbWrong: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(_ sender: UIButton) {
    }
    
}
