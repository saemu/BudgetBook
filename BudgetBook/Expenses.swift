//
//  Expenses.swift
//  BudgetBook
//
//  Created by Samuel Brand on 27.08.20.
//  Copyright © 2020 Samuel Brand. All rights reserved.
//

import Foundation

struct Expenses {
    var items: [Expense] {
        didSet {
            items.sort(by: >)
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
                self.items = decoded
                return
            }
        }
        self.items = []
    }

    func isEmpty() -> Bool {
        items.isEmpty
    }

    mutating func addItem(_ item: Expense) {
        self.items.append(item)
    }

    mutating func removx1eItem(_ indices: IndexSet) {
        self.items.remove(atOffsets: indices)
    }
}
