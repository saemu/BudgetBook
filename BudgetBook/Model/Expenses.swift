//
//  Expenses.swift
//  Haushaltsbuch
//
//  Created by Samuel Brand on 27.08.20.
//  Copyright © 2020 Samuel Brand. All rights reserved.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items: [Expense] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Expenses")
            }
        }
    }

    init() {
        if let items = UserDefaults.standard.data(forKey: "Expenses") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Expense].self, from: items) {
                self.items = decoded.sorted(by: >)
                return
            }
        }
        self.items = []
    }

    func addItem(_ item: Expense) {
        self.items.append(item)
    }
}
