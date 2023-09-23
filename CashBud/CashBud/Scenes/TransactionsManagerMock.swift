import Foundation
import CashBud.Mapper

class TransactionsManagerMock: TransactionsManagerProtocol {
    
    func readFromDocumentsDirectory(from filename: String) throws -> [Transaction] {
        // Mock implementation for reading transactions from the documents directory
        return []
    }
    
    func calculateMonthlyCosts(recurrence: Recurrence, costs: Double) -> Double {
        // Mock implementation for calculating monthly costs
        return 0
    }
    
    // Add other required functions and properties of TransactionsManagerProtocol with mock implementations
    
    // Use the Transaction model to create mock data for testing purposes
    
}
