//
//  AddExpense.swift
//  Haushaltsbuch
//
//  Created by Samuel Brand on 04.07.20.
//  Copyright © 2020 Samuel Brand. All rights reserved.
//

import SwiftUI

struct AddExpense: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses

    @State private var name = ""
    @State private var amount = ""
    @State private var date = Date()

    @State private var showCalendar = false

    func toggleCalendar() {
        showCalendar.toggle()
    }

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
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
                let formatter = NumberFormatter()
                formatter.locale = Locale.current
                formatter.numberStyle = .decimal
                if let amountValue = formatter.number(from: amount) {
                    let item = Expense(description: self.name, amount: Double(truncating: amountValue), date: self.date)
                    self.expenses.addItem(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }

    func dateString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

struct AddExpense_Previews: PreviewProvider {
    static var previews: some View {
        AddExpense(expenses: Expenses())
    }
}
