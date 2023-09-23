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
    }
    
    func delete(id: UUID) throws {
        // Implement code here
        // TODO: Implement the body of the delete function
        // You can use the id parameter to identify and delete the transaction
        // Add your implementation here
    }
    func calculateMonthlyCosts(recurrence: TransactionRecurrence, costs: Double) -> Double {
        // Implement code here
    }
    
    func sortTransactions(_ transactions: [Transaction]) -> [Transaction] {
        // Implement code here
        return transactions.sorted { $0.date > $1.date }
    }
    
    func getIconString(transactionCategory: TransactionCategory) -> String {
        // Implement code here
        switch transactionCategory {
        case .food:
            return "🍔"
        case .shopping:
            return "🛍️"
        case .transportation:
            return "🚗"
        case .entertainment:
            return "🎉"
        case .utilities:
            return "💡"
        case .other:
            return "💸"
        }
    }
            return "🛍️"
        case .transportation:
            return "🚗"
        case .entertainment:
            return "🎉"
        case .utilities:
            return "💡"
        case .other:
            return "💸"
        }
    }
    
    // Add result and response variables for functions that can throw or return an error
    
    // Implement every function to either return successfully if the variable for that function was set accordingly or to throw or return the set error
    
    }
