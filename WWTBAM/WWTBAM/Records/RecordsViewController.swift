//
//  RecordsViewController.swift
//  WWTBAM
//
//  Created by Andrey Rachitskiy on 11.02.2022.
//

import UIKit

class RecordsViewController: UIViewController {
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short

        return dateFormatter
    }()

    @IBOutlet var tableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "RecordCellTableViewCell", bundle: .main), forCellReuseIdentifier: "RecordCellTableViewCell")
        tableView.estimatedRowHeight = 50.0
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    @IBAction func closedButtonTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension RecordsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.records.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordCellTableViewCell", for: indexPath) as! RecordCellTableViewCell
        let record = Game.shared.records[indexPath.row]

        cell.dataTitle.text = "Дата Игры"
        cell.dataSubtitile.text = dateFormatter.string(from: record.date)

        cell.resultTitle.text = "Результат игры"
        cell.resultSubtitle.text = "\(record.score)"

        return cell
    }
}

extension RecordsViewController: UITableViewDelegate {

}
