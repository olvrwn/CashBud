//
//  LocalPersistenceServiceMock.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 10.09.23.
//

import Foundation

class LocalPersistenceServiceMock: LocalPersistenceServiceProtocol {
    // TODO: Implement mock methods for local persistence service
    
    func saveData(_ data: Data, forKey key: String) {
        // Simulate success scenario
    }
    
    func loadData(forKey key: String) -> Data? {
        // Simulate success scenario
        return nil
    }
}
    }
    
    func deleteData(forKey key: String) {
        // Simulate success scenario
    }
    
    // COMMENT: Removed the function clearAllData()
    
    // COMMENT: Removed the function simulateFailure()
}
