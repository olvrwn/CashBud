//
//  CreateTransactionViewModel.swift
//  CashBud
//
//  Created by Oliver Dieke on 06.08.23.
//

import SwiftUI

final class CreateTransactionViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published
    var errorOccured = false
    
    @Published
    var transaction = TransactionCreationProcessModel(category: .entertainment, recurrence: .monthly)
    
    // MARK: - Private Properties
    
    private let transactionsManager = TransactionsManager()
    
    //MARK: - Functions
    
    func writeTransaction(transaction: Transaction) {
        
        do {
            
            let transactions = self.readTransactions()
            try self.transactionsManager.writeToDocumentsDirectory(into: Constants.filename, data: transactions + [transaction])
        } catch {
            
            self.errorOccured.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.errorOccured.toggle()
                }
            }
        }
    }
    
    func readTransactions() -> [Transaction] {
        
        do {
            return try self.transactionsManager.readFromDocumentsDirectory(from: Constants.filename)
        } catch {
            
            self.errorOccured.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.errorOccured.toggle()
                }
            }
        }
        return []
    }
    
    func getIconString(for category: TransactionCategory) -> String {
        self.transactionsManager.getIconString(transactionCategory: category)
    }
}
