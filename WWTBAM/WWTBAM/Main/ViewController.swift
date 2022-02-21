//
//  ViewController.swift
//  WWTBAM
//
//  Created by Andrey Rachitskiy on 11.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var resultsButton: UIButton!
    @IBOutlet weak var difficultyControl: UISegmentedControl!

    let segueIdentifaer = "fromMenutoGameSegue"

    private var selectedDifficulty: Difficulty {
        switch self.difficultyControl.selectedSegmentIndex {
        case 0:
            return .easy
        case 1:
            return .hard
        default:
            return .easy
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "fromMenutoGameSegue":
            guard let gameVC = segue.destination as? GameViewController else { return }
            let manager = HardStrategyWithRND(difficulty: selectedDifficulty)
            gameVC.manager = manager

        default:
            break
        }
    }


    @IBAction func startGameButtonPressed (_ sender: UIButton) {
        performSegue(withIdentifier: "fromMenutoGameSegue", sender: nil)
}

}
