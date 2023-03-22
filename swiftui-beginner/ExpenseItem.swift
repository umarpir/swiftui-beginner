//
//  ExpenseItem.swift
//  swiftui-beginner
//
//  Created by Umar Pirmahomed on 20/03/2023.
//

import Foundation
struct ExpenseItem : Identifiable{
    var id = UUID()
    let name : String
    let type: String
    let amount : Double
}
