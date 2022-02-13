//
//  Questions.swift
//  WWTBAM
//
//  Created by Andrey Rachitskiy on 11.02.2022.
//

import Foundation
import UIKit

struct Question {

    let question: String
    let firstAnswer: String
    let secondAnswer: String
    let thirdAnswer: String
    let fourthAnswer: String
    let wrigthAnswer: Int
}

class QuestionManager {

    let questionList: Array<Question>
    var currentQuestion: Int = 0

    init() {
        self.questionList = [.init(question: "Какую фамилию носил главный герой поэмы А. Твардовского?", firstAnswer: "Тёркин", secondAnswer: "Обломов", thirdAnswer: "Пушкин", fourthAnswer: "Тютчев", wrigthAnswer: 1),
                                .init(question: "Где, если верить пословице, любопытной Варваре нос оторвали?", firstAnswer: "На базаре", secondAnswer: "На концерте", thirdAnswer: "В кино", fourthAnswer: "В магазине", wrigthAnswer: 1),
                                .init(question: "Как называют период времени, когда солнце в северных широтах не опускается за горизонт?", firstAnswer: "Полярный день", secondAnswer: "Полярная ночь", thirdAnswer: "Северное сияние", fourthAnswer: "Полярное солнцестояние", wrigthAnswer: 1),
                                .init(question: "Каким предметом китайцы стараются не пользоваться в преддверии Нового года, чтобы не разрушить счастья?", firstAnswer: "Нож", secondAnswer: "Вилка", thirdAnswer: "Ложка", fourthAnswer: "Палочки", wrigthAnswer: 1),
                                .init(question: "Какой цвет получается при смешении синего и красного?", firstAnswer: "Фиолетовый", secondAnswer: "Сиреневый", thirdAnswer: "Розовый", fourthAnswer: "Пурпурный", wrigthAnswer: 1)]

    }
}
