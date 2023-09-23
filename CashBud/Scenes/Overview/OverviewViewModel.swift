//
//  OverviewViewModel.swift
//  CashBud
//
//  Created by Oliver Dieke on 26.07.23.
//

import SwiftUI

final class OverviewViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published
    var errorOccured = false
    
    @Published
    var revenue: Double = 0
    
    @Published
    var expenses: Double = 0
    
    var sum: Double {
        revenue + expenses
    }
    
    let revenueTitle = "Revenue"
    let expensesTitle = "Expenses"
    let sumTitle = "Sum"
    
    // MARK: - Private Properties
    
    private let transactionsManager: TransactionsManagerProtocol
    
    // MARK: - Init
    
    init(transactionsManager: TransactionsManagerProtocol = TransactionsManagerMock()) {
        self.transactionsManager = transactionsManager
    }
    
    // MARK: - Functions
    
    func calculateValues() {
        
        var transactions: [Transaction]
        
        do {
            
            transactions = try self.transactionsManager.readFromDocumentsDirectory(from: Constants.filename)
            
            self.expenses = 0
            self.revenue = 0
            
            for transaction in transactions {
                
                switch transaction.type {
                    
                case .expense:
                    self.expenses += self.transactionsManager.calculateMonthlyCosts(
                        recurrence: transaction.recurrence,
                        costs: transaction.costs
                    )
                    
                case .revenue:
                    self.revenue += self.transactionsManager.calculateMonthlyCosts(
                        recurrence: transaction.recurrence,
                        costs: transaction.costs
                    )
                }
            }
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
