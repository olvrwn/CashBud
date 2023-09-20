CashBudTests/LocalPersistenceServiceMock.swift

import Foundation
@testable import CashBud

class LocalPersistenceServiceMock: LocalPersistenceServiceProtocol {
    func saveData(_ data: Data, forKey key: String) {
        // Implement saveData function
        // Save the data to local storage using the provided key
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func loadData(forKey key: String) -> Data? {
        // Implement loadData function
        // Load the data from local storage using the provided key
        return UserDefaults.standard.data(forKey: key)
    }
    
    func removeData(forKey key: String) {
        // Implement removeData function
        // Remove the data from local storage using the provided key
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    // Remove the removeAllData function as it is not mentioned in the LocalPersistenceServiceProtocol.
}
