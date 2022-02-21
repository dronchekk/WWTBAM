//
//  HardStrategyWithRND.swift
//  WWTBAM
//
//  Created by Andrey Rachitskiy on 15.02.2022.
//

import UIKit

final class HardStrategyWithRND {

    let questionManager: QuestionManager
    let currentDifficulty: Difficulty

    private var availableIndexs: Set<Int> = []

    init(difficulty: Difficulty = .easy) {
        self.currentDifficulty = difficulty
        self.questionManager = QuestionManager()

        for index in 0..<questionManager.questionList.count {
            availableIndexs.insert(index)
        }
    }

    func nextQuestion() -> Question? {
        switch currentDifficulty {
        case .easy:
            questionManager.currentQuestion += 1
            availableIndexs.removeFirst()
            guard questionManager.currentQuestion < questionManager.questionList.count else {
                return nil
            }

            return questionManager.questionList[questionManager.currentQuestion]

        case .hard:
            let index = availableIndexs.randomElement() ?? -1

            guard index >= 0, index < questionManager.questionList.count else {
                return nil
            }
            availableIndexs.remove(index)
            questionManager.currentQuestion = index

            return questionManager.questionList[index]
        }
    }

    func getCurrentQuestion() -> Question? {
        guard questionManager.currentQuestion < questionManager.questionList.count,
              questionManager.currentQuestion >= 0
        else {
            return nil
        }
        
        return questionManager.questionList[questionManager.currentQuestion]
    }

    func countWrightAnswers() -> Int {
        return questionManager.questionList.count - availableIndexs.count
    }

    func answerHandler(recognizer: UITapGestureRecognizer) -> Bool {
        guard let question = getCurrentQuestion() else {
            return false
        }
        if (recognizer.view?.tag ?? 0) == question.wrigthAnswer {
            return !availableIndexs.isEmpty
        } else {
            return false
        }
    }
}
