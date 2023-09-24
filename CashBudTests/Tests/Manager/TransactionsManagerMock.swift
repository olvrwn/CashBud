//
//  TransactionsManagerMock.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 10.09.23.
//

import Foundation
@testable import CashBud

class TransactionsManagerMock: TransactionsManager {
    
    var mockTransactions: [Transaction] = []
    
    override func getAllTransactions() -> [Transaction] {
        return mockTransactions
    }
    
    override func addTransaction(_ transaction: Transaction) {
        mockTransactions.append(transaction)
    }
    
    override func deleteTransaction(_ transaction: Transaction) {
        if let index = mockTransactions.firstIndex(of: transaction) {
            mockTransactions.remove(at: index)
        }
    }
    
    // Add any other necessary mock implementations of TransactionsManager methods
    
}
