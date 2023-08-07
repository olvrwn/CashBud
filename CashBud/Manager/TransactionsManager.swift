//
//  TransactionsManager.swift
//  CashBud
//
//  Created by Oliver Dieke on 01.08.23.
//

import Foundation

protocol TransactionsManagerProtocol {
    
    func readFromDocumentsDirectory<T: Codable>(from filename: String) throws -> T
    func writeToDocumentsDirectory(into filename: String, data: some Codable) throws
    func delete(id: UUID) throws
    func calculateMonthlyCosts(recurrence: TransactionRecurrence, costs: Double) -> Double
    func sortTransactions(_ transactions: [Transaction]) -> [Transaction]
    func getIconString(transactionCategory: TransactionCategory) -> String
}

final class TransactionsManager: TransactionsManagerProtocol {
    
    // MARK: - Private Properties
    
    private let localPersistenceService: LocalPersistenceServiceProtocol
    
    // MARK: - Init
    
    init(localPersistenceService: LocalPersistenceServiceProtocol = LocalPersistenceService()) {
        self.localPersistenceService = localPersistenceService
    }
    
    // MARK: - Functions
    
    func readFromDocumentsDirectory<T: Codable>(from filename: String) throws -> T {
        try self.localPersistenceService.readFromDocumentsDirectory(from: filename)
    }
    
    func writeToDocumentsDirectory(into filename: String, data: some Codable) throws {
        try self.localPersistenceService.writeToDocumentsDirectory(into: filename, data: data)
    }
    
    func delete(id: UUID) throws {
        
        var transactions: [Transaction] = try self.localPersistenceService.readFromDocumentsDirectory(from: Constants.filename)
        transactions.removeAll { transaction in
            transaction.id == id
        }
        try self.localPersistenceService.writeToDocumentsDirectory(into: Constants.filename, data: transactions)
    }
    
    func calculateMonthlyCosts(recurrence: TransactionRecurrence, costs: Double) -> Double {
        
        switch recurrence {
            
        case .weekly:
            return costs * 4.35
        case .monthly:
            return costs
        case .quarterly:
            return costs / 3
        case .yearly:
            return costs / 12
        }
    }
    
    func sortTransactions(_ transactions: [Transaction]) -> [Transaction] {
        
        var sorted = transactions
        sorted.sort { t1, t2 in
            
            if t1.type == .revenue && t2.type == .expense {
                true
            } else if t1.type == .expense && t2.type == .revenue {
                false
            } else {
                abs(self.calculateMonthlyCosts(
                    recurrence: t1.recurrence,
                    costs: t1.costs
                )) > abs(self.calculateMonthlyCosts(
                    recurrence: t2.recurrence,
                    costs: t2.costs
                ))
            }
        }
        return sorted
    }
    
    func getIconString(transactionCategory: TransactionCategory) -> String {
        
        switch transactionCategory {
        case .insurance:
            "doc.text"
            
        case .entertainment:
            "popcorn"
            
        case .rent:
            "house"
            
        case .work:
            "person.text.rectangle"
            
        case .socialBenefits:
            "person.2"
            
        case .credit:
            "dollarsign.arrow.circlepath"
            
        case .furnishings:
            "lamp.ceiling"
            
        case .primaryCare:
            "bolt"
            
        case .healthCare:
            "cross.case"
            
        case .mobility:
            "car"
            
        case .education:
            "graduationcap"
            
        case .others:
            "ellipsis"
            
        case .saveUp:
            "dollarsign.circle"
        }
    }
}
