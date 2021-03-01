//
//  Expense.swift
//  BudgetBook
//
//  Created by Samuel Brand on 27.08.20.
//  Copyright © 2020 Samuel Brand. All rights reserved.
//

import Foundation

struct Expense: Codable, Identifiable, Comparable {

    var id = UUID()
    var description: String
    var amount: Double
    var date: Date

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }

    static func < (lhs: Self, rhs: Self) -> Bool {
        if lhs.date < rhs.date {
            return true
        }
        if lhs.date == rhs.date, lhs.amount < rhs.amount {
            return true
        }
        return false
    }

    static func > (lhs: Self, rhs: Self) -> Bool {
        return rhs < lhs
    }

    var formattedAmount: String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        let amountString = currencyFormatter.string(from: NSNumber(value: self.amount))
        return amountString ?? ""
    }

    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let dateString = dateFormatter.string(from: self.date)
        return dateString
    }

    #if DEBUG
    static let example: Expense = Expense(description: "Dummy Expense", amount: 12345.67, date: Date())
    #endif
}

