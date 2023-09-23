import Foundation
import CashBud.Mapper

class TransactionsManagerMock: TransactionsManagerProtocol {
    
    func readFromDocumentsDirectory(from filename: String) throws -> [Transaction] {
        // Mock implementation for reading transactions from the documents directory
        // Add the function body
        return []
    }
    
    func calculateMonthlyCosts(recurrence: Recurrence, costs: Double) -> Double {
        // Mock implementation for calculating monthly costs
        // Add the function body
        return 0
    }
    
    // Add other required functions and properties of TransactionsManagerProtocol with mock implementations
    
    // Use the Transaction model to create mock data for testing purposes
    
}
