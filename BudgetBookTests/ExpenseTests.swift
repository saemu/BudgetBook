//
// Created by Samuel Brand on 01.03.21.
//

import XCTest

class ExpenseTests: XCTestCase {
    let testItem = Expense(id: UUID(), description: "Test Item", amount: 100, date: Date())

    func test_equals() {
        XCTAssertEqual(testItem, testItem)
    }

    func test_lower_earlierDate() {
        let earlierItem = Expense(id: UUID(),
                                  description: "Earlier Item",
                                  amount: 100,
                                  date: Date().addingTimeInterval(-3600))
        XCTAssertTrue(earlierItem < testItem)
    }

    func test_lower_laterDate() {
        let laterItem = Expense(id: UUID(),
                                description: "Earlier Item",
                                amount: 100,
                                date: Date().addingTimeInterval(3600))
        XCTAssertFalse(laterItem < testItem)
    }

    func test_lower_sameDateHigherAmount() {
        let sameDateItem = Expense(id: UUID(),
                                   description: "Same Date",
                                   amount: 200,
                                   date: testItem.date)
        XCTAssertTrue(testItem < sameDateItem)
    }

    func test_lower_sameDateLowerAmount() {
        let sameDateItem = Expense(id: UUID(),
                                   description: "Same Date",
                                   amount: 1,
                                   date: testItem.date)
        XCTAssertFalse(testItem < sameDateItem)
    }

    func test_greater() {
        let earlierItem = Expense(id: UUID(),
                                  description: "Earlier Item",
                                  amount: 100,
                                  date: Date().addingTimeInterval(-3600))
        XCTAssertTrue(testItem > earlierItem)
    }

    func test_formattedDate() {
        let formattedValue = testItem.formattedDate
        let expectedValue = expectedDate()
        XCTAssertEqual(formattedValue, expectedValue)
    }

    func test_formattedAmount() {
        let formattedValue = testItem.formattedAmount
        let expectedValue = expectedAmount()
        XCTAssertEqual(formattedValue, expectedValue)
    }

    private func expectedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let expectedValue = dateFormatter.string(from: testItem.date)
        return expectedValue
    }

    private func expectedAmount() -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        let amountString = currencyFormatter.string(from: NSNumber(value: testItem.amount))
        return amountString ?? ""
    }
}
