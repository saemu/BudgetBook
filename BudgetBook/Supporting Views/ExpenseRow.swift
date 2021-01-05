//
//  ExpenseRow.swift
//  Haushaltsbuch
//
//  Created by Samuel Brand on 05.07.20.
//  Copyright © 2020 Samuel Brand. All rights reserved.
//

import SwiftUI

struct ExpenseRow: View {
    let item: Expense

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(item.description)
                    .font(.headline)
                Text(item.formattedDate)
                    .font(.subheadline)
            }

            Spacer()
            Text(item.formattedAmount)
        }
    }
}

struct ExpenseRow_Previews: PreviewProvider {

    static let expenseItem = Expense(description: "Dummy Expense", amount: 12345.67, date: Date())

    static var previews: some View {
        ExpenseRow(item: expenseItem)
    }
}
