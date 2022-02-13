//
//  Game.swift
//  WWTBAM
//
//  Created by Andrey Rachitskiy on 11.02.2022.
//

import Foundation

struct Record: Codable {
    let date: Date
    let score: Double
}

final class Game {

    static let shared = Game()

    private(set) var records: [Record] = [] {
        didSet {
            recordsCaretaker.save(records: records)
        }
    }

    private let recordsCaretaker = RecordsCaretaker()

    var currentSession: GameSession?

    private init() {
        records = recordsCaretaker.retrieveRecords()
    }

    func addRecord(_ record: Record) {
        self.records.append(record)
    }

    func clearRecords() {
        self.records = []
    }
}

class GameSession {

    let overallQuestioncount: Int
    var wrigtAnswersCount: Int = 0

    init(overallQuestioncount: Int) {
        self.overallQuestioncount = overallQuestioncount
    }
}

extension GameSession: GameHandler {
    func updateWrigtAnswersCount(_ count: Int) {
        self.wrigtAnswersCount = count
    }

    func getRecord() -> Record {
        return Record(date: Date(), score: Double(wrigtAnswersCount) / Double(overallQuestioncount) * 100.0)
    }
}
