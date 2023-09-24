CashBudTests/Mocks/LocalPersistenceServiceMock.swift

import Foundation
@testable import CashBud

class LocalPersistenceServiceMock: LocalPersistenceServiceProtocol {
    
    // MARK: - Properties
    
    var readFromDocumentsDirectoryCalled = false
    var writeToDocumentsDirectoryCalled = false
    var deleteCalled = false
    
    // MARK: - LocalPersistenceServiceProtocol
    
    func readFromDocumentsDirectory<T: Codable>(from filename: String) throws -> T {
        readFromDocumentsDirectoryCalled = true
        // Add mock implementation here
        // Return a mock object of type T
    }
    
    func writeToDocumentsDirectory(into filename: String, data: some Codable) throws {
        writeToDocumentsDirectoryCalled = true
        // Add mock implementation here
    }
    
    func delete(id: UUID) throws {
        deleteCalled = true
        // Add mock implementation here
    }
}
