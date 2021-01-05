//
//  Expense.swift
//  Haushaltsbuch
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

    static func == (lhs: Expense, rhs: Expense) -> Bool {
        return lhs.id == rhs.id
    }

    static func < (lhs: Expense, rhs: Expense) -> Bool {
        return lhs.date < rhs.date && lhs.amount < rhs.amount
    }

    var formattedAmount: String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
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
}
