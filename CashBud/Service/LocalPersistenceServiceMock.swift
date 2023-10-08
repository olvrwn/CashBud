CashBud/Service/LocalPersistenceServiceMock.swift

// Implement LocalPersistenceServiceMock class
class LocalPersistenceServiceMock: LocalPersistenceServiceProtocol {
    // Implement functions of the protocol
    func saveTransaction(_ transaction: Transaction) throws {
        var result: Result<Void, Error>?
        // Add code to handle saving the transaction and set the result variable accordingly
        if let result = result {
            throw result.error
        } else {
            // Return successfully
        }
    }
    
    // Implement other functions of the protocol
    // ...
}
