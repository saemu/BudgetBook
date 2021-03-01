//
//  ExpenseRow.swift
//  BudgetBook
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
    static var previews: some View {
        ExpenseRow(item: Expense.example)
    }
}
