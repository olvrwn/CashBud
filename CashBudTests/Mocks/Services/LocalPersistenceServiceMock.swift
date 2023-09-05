//
//  LocalPersistenceServiceMock.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 02.09.23.
//

import Foundation
@testable import CashBud

final class LocalPersistenceServiceMock: LocalPersistenceServiceProtocol {
    
    var writeToDocumentsDirectoryResult: Result<Void, Error>?
    var readFromDocumentsDirectoryResult: Result<[Transaction], Error>?
    
    func writeToDocumentsDirectory<T>(into filename: String, data: T) throws where T: Codable {
        
        switch self.writeToDocumentsDirectoryResult {
        case .success:
            return ()
            
        case .failure(let failure):
            throw failure
            
        case .none:
            fatalError("writeToDocumentsDirectoryResult not set")
        }
    }
    
    func readFromDocumentsDirectory<T>(from filename: String) throws -> T where T: Codable {
        
        switch self.readFromDocumentsDirectoryResult {
        case .success(let success):
            return success as! T
            
        case .failure(let failure):
            throw failure
            
        case .none:
            fatalError("readFromDocumentsDirectoryResult not set")
        }
    }
}
