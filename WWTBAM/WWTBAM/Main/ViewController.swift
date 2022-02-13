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
    let segueIdentifaer = "fromMenutoGameSegue"



    override func viewDidLoad() {
        super.viewDidLoad()
//        destination.onGameEnd = { [weak self] result in
//            self?.lastResultLabel.text = "Последний результат: \(result)"
//        }
    }

    @IBAction func startGameButtonPressed (_ sender: UIButton) {
        performSegue(withIdentifier: "fromMenutoGameSegue", sender: nil)
}

}
