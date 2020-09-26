//
//  ContentView.swift
//  BudgetBook
//
//  Created by Samuel Brand on 26.09.20.
//

import SwiftUI

struct BudgetBook: View {
    @ObservedObject var expenses = Expenses()

    @State private var showingAddExpense = false

    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items.sorted(by: >)) { item in
                    NavigationLink(destination: ExpenseView(expense: item)) {
                        ExpenseRow(item: item)
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("Budget Book")
            .navigationBarItems(leading: EditButton()
                                    .disabled(expenses.items.isEmpty),
                                trailing:
                                    Button {
                                        self.showingAddExpense.toggle()
                                    } label: {
                                        Image(systemName: "plus.circle")
                                    }
            )
            .sheet(isPresented: $showingAddExpense) {
                AddExpense(expenses: self.expenses)
            }
        }
    }

    func removeItems(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetBook()
    }
}
