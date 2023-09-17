import Foundation

class TransactionsManagerMock: TransactionsManagerProtocol {
    
    func fetchTransactions(completion: @escaping (Result<[Transaction], Error>) -> Void) {
        // Implementation goes here
        let result: Result<[Transaction], Error> = .success([])
        completion(result)
    }
    
    func addTransaction(_ transaction: Transaction, completion: @escaping (Result<Void, Error>) -> Void) {
        // Implementation goes here
        let result: Result<Void, Error> = .success(())
        completion(result)
    }
    
    func deleteTransaction(withID id: String, completion: @escaping (Result<Void, Error>) -> Void) {
        // Implementation goes here
        let result: Result<Void, Error> = .success(())
        completion(result)
    }
    
    func updateTransaction(_ transaction: Transaction, completion: @escaping (Result<Void, Error>) -> Void) {
        // Implementation goes here
        let result: Result<Void, Error> = .success(())
        completion(result)
    }
    
    func searchTransactions(withKeyword keyword: String, completion: @escaping (Result<[Transaction], Error>) -> Void) {
        // Implementation goes here
        let result: Result<[Transaction], Error> = .success([])
        completion(result)
    }
    
    func getTransaction(withID id: String, completion: @escaping (Result<Transaction, Error>) -> Void) {
        // Implementation goes here
        let result: Result<Transaction, Error> = .success(Transaction())
        completion(result)
    }
    
    func getTransactionCount(completion: @escaping (Result<Int, Error>) -> Void) {
        // Implementation goes here
        let result: Result<Int, Error> = .success(0)
        completion(result)
    }
    
    func getTransactionTotal(completion: @escaping (Result<Double, Error>) -> Void) {
        // Implementation goes here
        let result: Result<Double, Error> = .success(0.0)
        completion(result)
    }
    
    func getTransactionAverage(completion: @escaping (Result<Double, Error>) -> Void) {
        // Implementation goes here
        let result: Result<Double, Error> = .success(0.0)
        completion(result)
    }
    
    func getTransactionMinimum(completion: @escaping (Result<Double, Error>) -> Void) {
        // Implementation goes here
        let result: Result<Double, Error> = .success(0.0)
        completion(result)
    }
    
    func getTransactionMaximum(completion: @escaping (Result<Double, Error>) -> Void) {
        // Implementation goes here
        let result: Result<Double, Error> = .success(0.0)
        completion(result)
    }
}
