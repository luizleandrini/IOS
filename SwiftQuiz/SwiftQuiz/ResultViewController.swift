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
    
    var totalCorrectAnswers: Int = 0
    var totalAnswers: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        lbAnswer.text = "Perguntas respondidas: \(totalAnswers)"
        lbCorrect.text = "Perguntas cprretas: \(totalCorrectAnswers)"
        lbWrong.text = "Perguntas erradas: \(totalAnswers - totalCorrectAnswers)"
        
        let score = totalCorrectAnswers*100/totalAnswers
        labelScore.text = "\(score)%"
        
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
