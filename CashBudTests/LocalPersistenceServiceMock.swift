CashBudTests/LocalPersistenceServiceMock.swift

import Foundation
@testable import CashBud

class LocalPersistenceServiceMock: LocalPersistenceServiceProtocol {
    func saveData(_ data: Data, forKey key: String) {
        // Implement saveData function
    }
    
    func loadData(forKey key: String) -> Data? {
        // Implement loadData function
        return nil
    }
    
    func removeData(forKey key: String) {
        // Implement removeData function
    }
    
    func removeAllData() {
        // Implement removeAllData function
    }
}
