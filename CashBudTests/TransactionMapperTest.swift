import XCTest
@testable import CashBud

class TransactionMapperTest: XCTestCase {
    var transactionMapper: TransactionMapper!
    
    override func setUp() {
        super.setUp()
        transactionMapper = TransactionMapper()
    }
    
    override func tearDown() {
        transactionMapper = nil
        super.tearDown()
    }
    
    func testMapTransaction() {
        // Test case for mapping a transaction
        let transaction = Transaction(id: "1", amount: 10.0, date: Date())
        let mappedTransaction = transactionMapper.mapTransaction(from: transaction)
        
        XCTAssertEqual(mappedTransaction.id, "1")
        XCTAssertEqual(mappedTransaction.amount, 10.0)
        XCTAssertEqual(mappedTransaction.date, transaction.date)
    }
    
    // Add more test cases for other methods in the TransactionMapper class
    
    static var allTests = [
        ("testMapTransaction", testMapTransaction),
        // Add more test cases here
    ]
}

extension TransactionMapper {
    func mapTransaction(from transaction: Transaction) -> MappedTransaction {
        // Implementation of mapTransaction method
    }
}
