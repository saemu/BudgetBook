//
//  ContentView.swift
//  BudgetBook
//
//  Created by Samuel Brand on 26.09.20.
//

import SwiftUI

struct BudgetBookView: View {
    @ObservedObject var budgetBook: BudgetBook

    @State private var showingAddExpense = false

    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(budgetBook.expenseItems) { item in
                        NavigationLink(destination: ExpenseView(expense: item)) {
                            ExpenseRow(item: item)
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                .navigationBarTitle("Budget Book")
                .navigationBarItems(leading: EditButton()
                                        .disabled(budgetBook.hasExpense()),
                                    trailing: Button {
                                        self.showingAddExpense.toggle()
                                    } label: {
                                        Image(systemName: "plus.circle")
                                    }
                )
                .sheet(isPresented: $showingAddExpense) {
                    AddExpense(addItem: budgetBook.addExpense)
                }
            }
            Spacer()
            Button("Add Item") {
                showingAddExpense.toggle()
            }
            Spacer()
        }
    }

    private func removeItems(at offset: IndexSet) {
        budgetBook.removeExpense(offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetBookView(budgetBook: BudgetBook())
    }
}
