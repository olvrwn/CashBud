//
//  TransactionsManagerMock.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 02.09.23.
//

import Foundation
@testable import CashBud

final class TransactionsManagerMock: TransactionsManagerProtocol {
    
    var readFromDocumentsDirectoryResult: Result<[Transaction], Error>?
    var writeToDocumentsDirectoryResult: Result<Void, Error>?
    var deleteResult: Result<Void, Error>?
    var calculateMonthlyCostsResponse: Double?
    var sortTransactionResponse: [CashBud.Transaction]?
    var getIconStringResponse: String?
    
    func readFromDocumentsDirectory<T>(from filename: String) throws -> T where T : Decodable, T : Encodable {
        
        switch self.readFromDocumentsDirectoryResult {
        case .success(let success):
            return success as! T
            
        case .failure(let failure):
            throw failure
            
        case .none:
            fatalError("readFromDocumentsDirectoryResult not set")
        }
    }
    
    func writeToDocumentsDirectory(into filename: String, data: some Decodable & Encodable) throws {
        
        switch self.writeToDocumentsDirectoryResult {
        case .success:
            return
            
        case .failure(let failure):
            throw failure
            
        case .none:
            fatalError("writeToDocumentsDirectoryResult not set")
        }
    }
    
    func delete(id: UUID) throws {
        
        switch self.deleteResult {
        case .success:
            return
            
        case .failure(let failure):
            throw failure
            
        case .none:
            fatalError("deleteResult not set")
        }
    }
    
    func calculateMonthlyCosts(recurrence: CashBud.TransactionRecurrence, costs: Double) -> Double {
        
        guard let response = self.calculateMonthlyCostsResponse else {
            fatalError("calculateMonthlyCostsResponse not set")
        }
        return response
    }
    
    func sortTransactions(_ transactions: [CashBud.Transaction]) -> [CashBud.Transaction] {
    
        guard let response = self.sortTransactionResponse else {
            fatalError("sortTransactionsResponse not set")
        }
        return response
    }
    
    func getIconString(transactionCategory: CashBud.TransactionCategory) -> String {
        
        guard let response = self.getIconStringResponse else {
            fatalError("getIconString not set")
        }
        return response
    }
}
