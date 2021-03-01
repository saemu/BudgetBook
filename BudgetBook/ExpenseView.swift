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
                RowItem(description: "Amount", value: expense.formattedAmount)
                RowItem(description: "Date", value: expense.formattedDate)
            }
            .navigationBarTitle(Text(expense.description), displayMode: .inline)
        }
    }
}

struct ExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseView(expense: Expense.example)
    }
}
