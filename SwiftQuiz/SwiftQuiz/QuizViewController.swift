//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Luiz Guilherme on 12/05/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet weak var viTimer: UIView!
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet var btAnswers: [UIButton]!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
    }
    
}
