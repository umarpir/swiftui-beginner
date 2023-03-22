//
//  Expenses.swift
//  swiftui-beginner
//
//  Created by Umar Pirmahomed on 20/03/2023.
//

import Foundation

class Expenses: ObservableObject{
    @Published var items = [ExpenseItem]()
}
