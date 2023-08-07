//
//  TransactionCreationProcessModel.swift
//  CashBud
//
//  Created by Oliver Dieke on 05.08.23.
//

import Foundation


struct TransactionCreationProcessModel: Hashable {
    
    let id = UUID()
    var type: TransactionType?
    var category: TransactionCategory?
    var recurrence: TransactionRecurrence?
    var title: String = ""
    var costs: Double?
}
