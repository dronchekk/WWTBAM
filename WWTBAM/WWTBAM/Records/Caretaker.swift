//
//  Caretaker.swift
//  WWTBAM
//
//  Created by Andrey Rachitskiy on 11.02.2022.
//

import Foundation

final class Caretaker {

    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    func save(records: [Record]) {
        do {
            let data = try self.encoder.encode(records)
            let key = String(describing: Record.self)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }

    func save(records: [Question]) {
        do {
            let data = try self.encoder.encode(records)
            let key = String(describing: Question.self)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }

    func retrieveRecords() -> [Record] {
        let key = String(describing: Record.self)
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }

        do {
            return try self.decoder.decode([Record].self, from: data)
        } catch {
            print(error)
            return []
        }
    }

    func retrieveQuestion() -> [Question] {
        let key = String(describing: Question.self)
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }

        do {
            return try self.decoder.decode([Question].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
