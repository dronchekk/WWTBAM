//
//  GameVIewController.swift
//  WWTBAM
//
//  Created by Andrey Rachitskiy on 11.02.2022.
//

import UIKit

class GameViewController: UIViewController {

    private weak var delegate: GameHandler?
    var difficulty: Difficulty = .easy

    @IBOutlet var textView: UITextView!

    @IBOutlet var firstAnswerWrapperView: UIView!
    @IBOutlet var firstAnswerLabel: UILabel!

    @IBOutlet var secondAnswerWrapperView: UIView!
    @IBOutlet var secondAnswerLabel: UILabel!

    @IBOutlet var thirdAnswerWrapperView: UIView!
    @IBOutlet var thirdAnswerLabel: UILabel!

    @IBOutlet var fourthAnswerWrapperView: UIView!
    @IBOutlet var fourthAnswerLabel: UILabel!

    @IBOutlet var qurrentQuestionNumberLabel: UILabel!
    @IBOutlet var competingStatusLabel: UILabel!

    var manager: HardStrategyWithRND?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let session = GameSession(overallQuestioncount: manager?.questionManager.questionList.count ?? 0)
        self.delegate = session
        Game.shared.currentSession = session
        setQuestionValues()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let delegate = delegate else {
            return
        }
        Game.shared.addRecord(delegate.getRecord())
    }
}

private extension GameViewController {

    func setQuestionValues() {
        let question = manager?.nextQuestion()
        textView.text = question?.question
        firstAnswerLabel.text = question?.firstAnswer
        secondAnswerLabel.text = question?.secondAnswer
        thirdAnswerLabel.text = question?.thirdAnswer
        fourthAnswerLabel.text = question?.fourthAnswer

        qurrentQuestionNumberLabel.text = "Номер текущего вопроса: "
        + "\(manager?.countWrightAnswers() ?? 0)"
        + " из "
        + "\((manager?.questionManager.questionList.count ?? 0))"
        competingStatusLabel.text = "Пройдено: " + "\(delegate?.competingStatus ?? Double.zero)" + "%"
    }

    func setupView() {
        setupTextView()
        setupAnswerWrappers()
    }

    @objc func answerTapGestureRecognizer(recognizer: UITapGestureRecognizer) {
        let result = manager?.answerHandler(recognizer: recognizer) ?? false
        delegate?.updateWrigtAnswersCount(manager?.countWrightAnswers() ?? 0)
        if !result {
            dismiss(animated: true, completion: nil)
            return
        }
        setQuestionValues()
    }

    func setupTextView() {
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.isSelectable = false
        textView.delegate = self
    }

    func setupAnswerWrappers() {
        let firstRecognizer = UITapGestureRecognizer(target: self, action: #selector(answerTapGestureRecognizer(recognizer:)))
        firstAnswerWrapperView.addGestureRecognizer(firstRecognizer)
        firstAnswerWrapperView.tag = 1

        let secondRecognizer = UITapGestureRecognizer(target: self, action: #selector(answerTapGestureRecognizer(recognizer:)))
        secondAnswerWrapperView.addGestureRecognizer(secondRecognizer)
        secondAnswerWrapperView.tag = 2

        let thirdRecognizer = UITapGestureRecognizer(target: self, action: #selector(answerTapGestureRecognizer(recognizer:)))
        thirdAnswerWrapperView.addGestureRecognizer(thirdRecognizer)
        thirdAnswerWrapperView.tag = 3

        let fourthRecognizer = UITapGestureRecognizer(target: self, action: #selector(answerTapGestureRecognizer(recognizer:)))
        fourthAnswerWrapperView.addGestureRecognizer(fourthRecognizer)
        fourthAnswerWrapperView.tag = 4
    }
}

extension GameViewController: UITextViewDelegate {

}

protocol GameHandler: AnyObject {

    var competingStatus: Double { get }

    func updateWrigtAnswersCount(_ count: Int)
    func getRecord() -> Record
}
