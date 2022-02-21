//
//  AddQuestionViewController.swift
//  WWTBAM
//
//  Created by Andrey Rachitskiy on 19.02.2022.
//

import UIKit

class AddQuestionViewController: UIViewController {

    @IBOutlet var questionTextField: UITextField!
    @IBOutlet var firstAnswerTextField: UITextField!
    @IBOutlet var secondAnswerTextField: UITextField!
    @IBOutlet var thirdAnswerTextField: UITextField!
    @IBOutlet var fourthAnswerTextField: UITextField!

    @IBOutlet var firstSwitch: UISwitch!
    @IBOutlet var secondSwitch: UISwitch!
    @IBOutlet var thirdSwitch: UISwitch!
    @IBOutlet var fourthSwitch: UISwitch!

    private lazy var switchList: NSHashTable<UISwitch> = {
        return NSHashTable<UISwitch>.init(options: .weakMemory)
    }()

    @IBOutlet var addButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    @IBAction func didTouchSwitch(_ sender: UISwitch) {
        if sender.isOn {
            for item in switchList.allObjects {
                if item === sender { continue }
                item.setOn(false, animated: true)
                item.setNeedsDisplay()
            }
        }
    }

    @IBAction func didTouchAddButton(_ sender: UIButton) {
        let questionText = questionTextField.text ?? ""
        let firstAnswerText = firstAnswerTextField.text ?? ""
        let secondAnswerText = secondAnswerTextField.text ?? ""
        let thirdAnswerText = thirdAnswerTextField.text ?? ""
        let fourthAnswerText = fourthAnswerTextField.text ?? ""
        let index = onSwitchIndex()

        guard !questionText.isEmpty,
              !firstAnswerText.isEmpty,
              !secondAnswerText.isEmpty,
              !thirdAnswerText.isEmpty,
              !fourthAnswerText.isEmpty,
              index >= 0
        else { return }

        let question = Question(
            question: questionText,
            firstAnswer: firstAnswerText,
            secondAnswer: secondAnswerText,
            thirdAnswer: thirdAnswerText,
            fourthAnswer: fourthAnswerText,
            wrigthAnswer: index
        )
        Caretaker().save(records: [question])
        switchList.removeAllObjects()
        dismiss(animated: true, completion: nil)
    }
}

private extension AddQuestionViewController {

    func setupView() {
        firstSwitch.tag = 1
        switchList.add(firstSwitch)

        secondSwitch.tag = 2
        switchList.add(secondSwitch)

        thirdSwitch.tag = 3
        switchList.add(thirdSwitch)

        fourthSwitch.tag = 4
        switchList.add(fourthSwitch)
    }

    func onSwitchIndex() -> Int {
        for item in switchList.allObjects {
            guard item.isOn else { continue }
            return item.tag
        }

        return -1
    }
}
