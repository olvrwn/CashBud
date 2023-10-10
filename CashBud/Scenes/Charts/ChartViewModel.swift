//
//  ChartViewModel.swift
//  CashBud
//
//  Created by Oliver Dieke on 02.08.23.
//

import SwiftUI

final class ChartViewModel: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published
    var errorOccured = false
    
    @Published
    var revenueData: [Transaction] = []
    
    @Published
    var expensesData: [Transaction] = []
    
    // MARK: - Private Properties
    
    private let transactionsManager: TransactionsManagerProtocol
    
    // MARK: - Init
    
    init(transactionsManager: TransactionsManagerProtocol = TransactionsManager()) {
        self.transactionsManager = transactionsManager
    }
    
    // MARK: - Functions
    
    func fetchAndDivideTransactions() {
        
        do {
            
            let transactions: [Transaction] = try self.transactionsManager.readFromDocumentsDirectory(from: Constants.filename)
            for transaction in transactions {
                
                switch transaction.type {
                case .expense:
                    self.expensesData.append(transaction)
                    
                case .revenue:
                    self.revenueData.append(transaction)
                }
            }
            self.formatTransactions()
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
    
    func calculateMonthlyCosts(transaction: Transaction) -> Double {
        self.transactionsManager.calculateMonthlyCosts(recurrence: transaction.recurrence, costs: transaction.costs)
    }
    }
    
    // MARK: - Private Functions
    
    extension ChartViewModel {
    
    private func formatTransactions() {
        
        for i in 0..<self.expensesData.count {
            self.expensesData[i].costs = abs(self.expensesData[i].costs)
        }
        
        for i in 0..<self.revenueData.count {
            self.revenueData[i].costs = abs(self.revenueData[i].costs)
        }
    }
    }
    
    // MARK: - Private Properties
    
    private let transactionsManager: TransactionsManagerProtocol
    
    // MARK: - Init
    
    init(transactionsManager: TransactionsManagerProtocol = TransactionsManager()) {
        self.transactionsManager = transactionsManager
    }
    
    // MARK: - Functions
    
    func fetchAndDivideTransactions() {
        
        do {
            
            let transactions: [Transaction] = try self.transactionsManager.readFromDocumentsDirectory(from: Constants.filename)
            for transaction in transactions {
                
                switch transaction.type {
                case .expense:
                    self.expensesData.append(transaction)
                    
                case .revenue:
                    self.revenueData.append(transaction)
                }
            }
            self.formatTransactions()
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
    
    func calculateMonthlyCosts(transaction: Transaction) -> Double {
        self.transactionsManager.calculateMonthlyCosts(recurrence: transaction.recurrence, costs: transaction.costs)
    }
}

// MARK: - Private Functions

extension ChartViewModel {
    
    private func formatTransactions() {
        
        for i in 0..<self.expensesData.count {
            self.expensesData[i].costs = abs(self.expensesData[i].costs)
        }
        
        for i in 0..<self.revenueData.count {
            self.revenueData[i].costs = abs(self.revenueData[i].costs)
        }
    }
}
