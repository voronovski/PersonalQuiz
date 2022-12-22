//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 18.08.2022.
//

import UIKit

class ResultViewController: UIViewController {
     
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    
    var answerChosen: [Answer]!
    var animalTypeResult: AnimalType!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
        showResult()
    }
 
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}

extension ResultViewController {
    private func showResult() {
        animalTypeResult = defineAnimal(for: answerChosen)
        resultLabel.text = "Вы - " + String(animalTypeResult.rawValue)
        resultDescriptionLabel.text = animalTypeResult.definition
    }
    
    private func defineAnimal(for answers: [Answer]) -> AnimalType {
        var dogAnswersCount = 0
        var catAnswersCount = 0
        var rabbitAnswersCount = 0
        var turtleAnswersCount = 0
        
        for answer in answers {
            switch answer.type {
            case .dog:
                dogAnswersCount += 1
            case .cat:
                catAnswersCount += 1
            case .rabbit:
                rabbitAnswersCount += 1
            case .turtle:
                turtleAnswersCount += 1
            }
        }
        
        switch max(dogAnswersCount, catAnswersCount, rabbitAnswersCount, turtleAnswersCount) {
        case dogAnswersCount:
            return .dog
        case catAnswersCount:
            return .cat
        case rabbitAnswersCount:
            return .rabbit
        default:
            return .turtle
        }
    }
}
