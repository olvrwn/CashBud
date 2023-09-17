import XCTest
@testable import CashBud

class TransactionMapperTest: XCTestCase {
    func testMapTransaction() {
        // Create a sample transaction data
        let transactionData = [
            "id": "1",
            "amount": 100.0,
            "date": "2022-01-01"
        ]
        
        // Create an instance of TransactionMapper
        let transactionMapper = TransactionMapper()
        
        // Call the mapTransaction(from:) function
        let transaction = transactionMapper.mapTransaction(from: transactionData)
        
        // Assert the mapped transaction properties
        XCTAssertEqual(transaction.id, "1")
        XCTAssertEqual(transaction.amount, 100.0)
        XCTAssertEqual(transaction.date, "2022-01-01")
    }
}
