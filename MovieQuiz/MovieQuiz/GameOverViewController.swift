//
//  GameOverViewController.swift
//  MovieQuiz
//
//  Created by Luiz Guilherme on 02/07/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {

    @IBOutlet weak var lbScore: UILabel!
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbScore.text = "\(score)"
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
