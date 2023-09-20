import Foundation
import CashBud

class TransactionsManagerMock: TransactionsManagerProtocol {
    func fetchTransactions(completion: @escaping (Result<[Transaction], Error>) -> Void) {
        // Implementation goes here
    }
    
    func createTransaction(_ transaction: Transaction, completion: @escaping (Result<Void, Error>) -> Void) {
        // Implementation goes here
    }
    
    func updateTransaction(_ transaction: Transaction, completion: @escaping (Result<Void, Error>) -> Void) {
        // Implementation goes here
    }
    
    func deleteTransaction(_ transaction: Transaction, completion: @escaping (Result<Void, Error>) -> Void) {
        // Implementation goes here
    }
    
    func fetchCategories(completion: @escaping (Result<[Category], Error>) -> Void) {
        // Implementation goes here
    }
    
    func createCategory(_ category: Category, completion: @escaping (Result<Void, Error>) -> Void) {
        // Implementation goes here
    }
    
    func updateCategory(_ category: Category, completion: @escaping (Result<Void, Error>) -> Void) {
        // Implementation goes here
    }
    
    func deleteCategory(_ category: Category, completion: @escaping (Result<Void, Error>) -> Void) {
        // Implementation goes here
    }
    
    func fetchAccounts(completion: @escaping (Result<[Account], Error>) -> Void) {
        // Implementation goes here
    }
    
    func createAccount(_ account: Account, completion: @escaping (Result<Void, Error>) -> Void) {
        // Implementation goes here
    }
    
    func updateAccount(_ account: Account, completion: @escaping (Result<Void, Error>) -> Void) {
        // Implementation goes here
    }
    
    func deleteAccount(_ account: Account, completion: @escaping (Result<Void, Error>) -> Void) {
        // Implementation goes here
    }
}
