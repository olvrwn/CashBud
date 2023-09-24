//
//  TransactionsManagerMock.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 10.09.23.
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
        guard let result = readFromDocumentsDirectoryResult else {
            fatalError("readFromDocumentsDirectoryResult is nil")
        }
        
        switch result {
        case .success(let success):
            guard let successValue = success as? T else {
                fatalError("Invalid success value type")
            }
            return successValue
        
        case .failure(let failure):
            throw failure
        }
        guard let response = self.getIconStringResponse else {
            fatalError("getIconString not set")
        }
        return response
    }
}
