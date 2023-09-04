//
//  TransactionsListViewModel.swift
//  CashBud
//
//  Created by Oliver Dieke on 31.07.23.
//

import SwiftUI

final class TransactionsListViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    let transactionsListScreenType: TransactionsListScreenType
    let transactionsListScreenTitle: String
    
    @Published
    var errorOccured = false
    
    @Published
    var transactions: [Transaction] = []
    
    // MARK: - Private Properties
    
    private let transactionsManager: TransactionsManagerProtocol
    
    // MARK: - Init
    
    init(
        transactionsListScreenType: TransactionsListScreenType,
        transactionsManager: TransactionsManagerProtocol = TransactionsManager()
    ) {
        self.transactionsListScreenType = transactionsListScreenType
        self.transactionsManager = transactionsManager
        
        switch self.transactionsListScreenType {
        case .expenses:
            self.transactionsListScreenTitle = "Expenses"
            
        case .revenue:
            self.transactionsListScreenTitle = "Revenue"
            
        case .sum:
            self.transactionsListScreenTitle = "Sum"
        }
    }
    
    // MARK: - Functions
    
    func getTransactions() {
        
        do {
            
            self.transactions = try self.transactionsManager.readFromDocumentsDirectory(from: Constants.filename)
            self.transactions = transactions.filter { transaction in
                
                switch self.transactionsListScreenType {
                case .expenses:
                    transaction.type == .expense
                    
                case .revenue:
                    transaction.type == .revenue
                    
                case .sum:
                    transaction.type == .revenue || transaction.type == .expense
                }
            }
            self.transactions = self.transactionsManager.sortTransactions(self.transactions)
        } catch {
            
            print(error)
            self.errorOccured.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.errorOccured.toggle()
                }
            }
        }
    }
    
    func sortTransactions() {
        self.transactions = self.transactionsManager.sortTransactions(self.transactions)
    }
    
    func deleteTransactionAndUpdate(at index: IndexSet) {
        
        for i in index {
            
            do {
                
                try self.transactionsManager.delete(id: self.transactions[i].id)
                self.getTransactions()
            } catch {
                
                print(error)
                self.errorOccured.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        self.errorOccured.toggle()
                    }
                }
            }
        }
    }
    
    func calculateCostsPerMonth(for transaction: Transaction) -> Double {
        self.transactionsManager.calculateMonthlyCosts(recurrence: transaction.recurrence, costs: transaction.costs)
    }
    
    func getIconString(for category: TransactionCategory) -> String {
        self.transactionsManager.getIconString(transactionCategory: category)
    }
    
    func makeRecurrenceDescription(recurrence: TransactionRecurrence) -> String {
        
        switch recurrence {
        case .weekly:
            return "week"
            
        case .monthly:
            return "month"
            
        case .quarterly:
            return "quarter"
            
        case .yearly:
            return "year"
        }
    }
}
