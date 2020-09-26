//
//  ExpenseView.swift
//  BudgetBook
//
//  Created by Samuel Brand on 30.09.20.
//

import SwiftUI

struct ExpenseView: View {

    struct RowItem: View {

        let description: String
        let value: String

        var body: some View {
            HStack {
                Text(description)
                    .padding(.leading)
                Spacer()
                Text(value)
                    .padding(.trailing)
            }
        }
    }

    var expense: Expense

    var body: some View {
        Form {
            Section(header: Text("Details")) {
                RowItem(description: "Amount", value: expense.amountString)
                RowItem(description: "Date", value: expense.formattedDate)
            }
            .navigationBarTitle(Text(expense.description), displayMode: .inline)
        }
    }
}

struct ExpenseView_Previews: PreviewProvider {
    static let expenseItem = Expense(description: "Dummy Expense", amount: 12345.67, date: Date())
    static var previews: some View {
        ExpenseView(expense: expenseItem)
    }
}
