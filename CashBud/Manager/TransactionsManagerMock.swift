CashBud/Manager/TransactionsManagerMock.swift

// Add necessary imports

import Foundation

// Implement the TransactionsManagerMock class that conforms to the TransactionsManagerProtocol

class TransactionsManagerMock: TransactionsManagerProtocol {
    
    // Implement every function of the TransactionsManagerProtocol
    
    func readFromDocumentsDirectory<T: Codable>(from filename: String) throws -> T {
        // Implement code here
    }
    
    func writeToDocumentsDirectory(into filename: String, data: some Codable) throws {
        // Implement code here
        // COMMENT: implement the body
        // Add code to write data to the specified filename in the documents directory
        let encoder = JSONEncoder()
        let encodedData = try encoder.encode(data)
        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(filename)
        try encodedData.write(to: fileURL)
    }
    
    func delete(id: UUID) throws {
        // Implement code here
    }
    
    func calculateMonthlyCosts(recurrence: TransactionRecurrence, costs: Double) -> Double {
        // Implement code here
    }
    
    func sortTransactions(_ transactions: [Transaction]) -> [Transaction] {
        // Implement code here
    }
    
    func getIconString(transactionCategory: TransactionCategory) -> String {
        // Implement code here
    }
    
    // Add result and response variables for functions that can throw or return an error
    
    // Implement every function to either return successfully if the variable for that function was set accordingly or to throw or return the set error
    
}
