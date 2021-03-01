//
//  Extensions.swift
//  BudgetBook
//
//  Created by Samuel Brand on 13.01.21.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
