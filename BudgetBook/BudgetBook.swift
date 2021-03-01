//
//  BudgetBook.swift
//  BudgetBook
//
//  Created by Samuel Brand on 06.01.21.
//

import SwiftUI

class BudgetBook: ObservableObject {
    @Published private var expenses: Expenses

    init() {
        expenses = Expenses()
    }

    var expenseItems: [Expense] {
        expenses.items
    }

    func hasExpense() -> Bool {
        expenses.isEmpty()
    }

    func addExpense(_ expense: Expense) {
        expenses.addItem(expense)
    }

    func removeExpense(_ offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }
}
