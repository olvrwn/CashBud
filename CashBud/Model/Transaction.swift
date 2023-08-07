//
//  Transaction.swift
//  CashBud
//
//  Created by Oliver Dieke on 25.07.23.
//

import Foundation
import SwiftData
import Charts

enum TransactionType: String, Codable, CaseIterable {
    
    case revenue = "Revenue"
    case expense = "Expense"
}

enum TransactionCategory: String, Codable, Plottable, CaseIterable {
    
    case credit = "Credit"
    case education = "Education"
    case entertainment = "Entertainment"
    case furnishings = "Furnishings"
    case healthCare = "Health Care"
    case insurance = "Insurance"
    case mobility = "Mobility"
    case primaryCare = "Primary Care" // electricity, water, heating, wifi
    case rent = "Rent"
    case saveUp = "Save up"
    case socialBenefits = "Social Benefits"
    case work = "Work"
    case others = "Others"
}

enum TransactionRecurrence: String, Codable, CaseIterable {
    
    case weekly = "Weekly"
    case monthly = "Monthly"
    case quarterly = "Quarterly"
    case yearly = "Yearly"
}

struct Transaction: Codable, Hashable {
    
    var id: UUID = UUID()
    var type: TransactionType
    var category: TransactionCategory
    var recurrence: TransactionRecurrence
    var title: String
    var costs: Double
}
