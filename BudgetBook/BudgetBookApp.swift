//
//  BudgetBookApp.swift
//  BudgetBook
//
//  Created by Samuel Brand on 26.09.20.
//

import SwiftUI

@main
struct BudgetBookApp: App {
    var body: some Scene {
        WindowGroup {
            let budgetBook = BudgetBook()
            BudgetBookView(budgetBook: budgetBook)
        }
    }
}
