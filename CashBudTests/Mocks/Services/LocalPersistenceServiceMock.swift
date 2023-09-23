//
//  LocalPersistenceServiceMock.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 10.09.23.
//

import Foundation

class LocalPersistenceServiceMock: LocalPersistenceServiceProtocol {
    // TODO: Implement mock methods for local persistence service
    
    func loadData(forKey key: String) -> Data? {
        // Simulate success scenario
        return nil
    }
    
    func deleteData(forKey key: String) {
        // Simulate success scenario
    }
    
    func clearAllData() {
        // Simulate success scenario
    }
    
    func simulateFailure() {
        // Simulate failure scenario
    }
}
