import XCTest
@testable import CashBud

final class TransactionsManagerMock: TransactionsManagerProtocol {
    // Optional variables for each function in the protocol
    var fetchTransactionsResult: Result<[Transaction], Error>?
    var addTransactionResult: Result<Void, Error>?
    var deleteTransactionResult: Result<Void, Error>?
    
    // Mock functions that return the values set in the variables
    func fetchTransactions(completion: @escaping (Result<[Transaction], Error>) -> Void) {
        if let result = fetchTransactionsResult {
            completion(result)
        }
    }
    
    func addTransaction(_ transaction: Transaction, completion: @escaping (Result<Void, Error>) -> Void) {
        if let result = addTransactionResult {
            completion(result)
        }
    }
    
    func deleteTransaction(withID id: String, completion: @escaping (Result<Void, Error>) -> Void) {
        if let result = deleteTransactionResult {
            completion(result)
        }
    }
}
