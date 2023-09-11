//
//  LocalPersistenceServiceMock.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 09.09.23.
//

import Foundation
@testable import CashBud // manuell: @

final class LocalPersistenceServiceMock: LocalPersistenceServiceProtocol { // manual: f
    
    var readFromDocumentsDirectoryResult: Result<[Transaction], Error>? // manual: v
    var writeToDocumentsDirectoryResult: Result<Void, Error>? // manual: v
    
    func writeToDocumentsDirectory<T: Codable>(into filename: String, data: T) throws { // generated by Xcode because of protocol
        switch writeToDocumentsDirectoryResult { // manual: s
        case .success:
            return
        case .failure(let error):
            throw error
        case .none:
            throw NSError()
        } // manual
    }
    
    func readFromDocumentsDirectory<T: Codable>(from filename: String) throws -> T { // generated by Xcode because of protocol
        switch readFromDocumentsDirectoryResult {
            case .success(let transactions): // manual: c
                return transactions as! T
            case .failure(let error):
                throw error
            case .none:
                throw NSError()
        } // manual
    }
} // manual
