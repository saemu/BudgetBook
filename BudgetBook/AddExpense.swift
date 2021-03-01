//
//  AddExpense.swift
//  BudgetBook
//
//  Created by Samuel Brand on 04.07.20.
//  Copyright © 2020 Samuel Brand. All rights reserved.
//

import SwiftUI

struct AddExpense: View {
    @Environment(\.presentationMode) var presentationMode

    var addItem: (Expense) -> Void

    @State private var name = ""
    @State private var amount = ""
    @State private var date = Date()

    @State private var showCalendar = false

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                    .keyboardType(.default)
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
                Button(dateString(), action: toggleCalendar)
                if self.showCalendar {
                    DatePicker("Select date", selection: $date, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .labelsHidden()
                }
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing: Button("Save") {
                saveItem()
            })
        }
    }

    private func toggleCalendar() {
        hideKeyboard()
        showCalendar.toggle()
    }

    private func saveItem() {
        let amountValue = formatAmount(amount)
        let item = Expense(description: self.name, amount: amountValue, date: self.date)
        self.addItem(item)
        self.presentationMode.wrappedValue.dismiss()
    }

    private func dateString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }

    private func formatAmount(_ amount: String) -> Double {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .decimal
        return Double(truncating: formatter.number(from: amount) ?? 0.0)
    }
}

struct AddExpense_Previews: PreviewProvider {
    static var previews: some View {
        AddExpense { expense in
            print(expense)
        }
    }
}
