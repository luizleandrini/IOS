//
//  QuizManager.swift
//  MovieQuiz
//
//  Created by Luiz Guilherme on 02/07/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import Foundation

typealias Round = (quiz: Quiz, options: [QuizOption])

class QuizManager {
    let quizes: [Quiz]
    let quizOptions: [QuizOption]
    var round: Round?
    var score: Int

    init() {
        score = 0
        let quizesURL = Bundle.main.url(forResource: "quizes", withExtension: "json")!
        do{
            let quizesData = try Data(contentsOf: quizesURL)
            quizes = try JSONDecoder().decode([Quiz].self, from: quizesData)
            let quizOptionsURL = Bundle.main.url(forResource: "options", withExtension: "json")!
            let quizOptionsData = try! Data(contentsOf: quizOptionsURL)
            quizOptions = try! JSONDecoder().decode([QuizOption].self, from: quizOptionsData)
        }catch{
            print(error.localizedDescription)
            quizes = []
            quizOptions = []
        }
    }
    func generateRandomQuiz() -> Round{
        let quizIndex = Int(arc4random_uniform(UInt32(quizes.count)))
        let quiz = quizes[quizIndex]
        var indexes: Set<Int> = [quizIndex]
        while indexes.count < 4 {
            let index = Int(arc4random_uniform(UInt32(quizes.count)))
            indexes.insert(index)
        }
        let options = indexes.map({quizOptions[$0]})
        round = (quiz, options)
        return round!
    }
    func checkAnswer(_ answer: String){
        guard let round = round else {return}
        if answer == round.quiz.name{
            score += 1
        }
    }
}

struct Quiz: Codable {
    let name: String
    let number: Int
}

struct QuizOption: Codable {
    let name: String
}






















//typealias Round = (quiz: Quiz, options: [QuizOption])
//
//
//class QuizManager{
//
//    let quizes: [Quiz]
//    let quizOptions: [QuizOption]
//    var score: Int = 0
//    var round: Round?
//
//    init() {
//        score = 0
//        let quizesURL = Bundle.main.url(forResource: "quizes", withExtension: "json")!
//        do{
//            let quizesData = try Data(contentsOf: quizesURL)
//            quizes = try JSONDecoder().decode([Quiz].self, from: quizesData)
//            let quizOptionsURL = Bundle.main.url(forResource: "options", withExtension: "json")!
//            let quizOptionsData = try! Data(contentsOf: quizOptionsURL)
//            quizOptions = try! JSONDecoder().decode([QuizOption].self, from: quizOptionsData)
//        }catch{
//            print(error.localizedDescription)
//            quizes = []
//            quizOptions = []
//        }
//    }
//    func generateRandomQuiz() -> Round{
//        let quizIndex = Int(arc4random_uniform(UInt32(quizes.count)))
//        let quiz = quizes[quizIndex]
//        var indexes: Set<Int> = [quizIndex]
//        while indexes.count < 4 {
//            let index = Int(arc4random_uniform(UInt32(quizes.count)))
//            indexes.insert(index)
//        }
//        let options = indexes.map({quizOptions[$0]})
//        round = (quiz, options)
//        return round!
//    }
//    func checkAnswer(_ answer: String){
//        guard let round = round else {return}
//        if answer == round.quiz.name{
//            score += 1
//        }
//    }
//}
//
//
//struct Quiz: Codable {
//    let name: String
//    let number: Int
//}
//
//struct QuizOption: Codable {
//    let name: String
//}
