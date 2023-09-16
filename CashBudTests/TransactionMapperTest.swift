// CashBudTests/TransactionMapperTest.swift

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
        // Test mapping a valid transaction
        let transactionData = ["id": "1", "amount": 10.0, "description": "Test Transaction"]
        let transaction = transactionMapper.mapTransaction(from: transactionData)
        XCTAssertEqual(transaction.id, "1")
        XCTAssertEqual(transaction.amount, 10.0)
        XCTAssertEqual(transaction.description, "Test Transaction")
    }
    
    func testMapTransaction_withMissingData() {
        // Test mapping a transaction with missing data
        let transactionData = ["id": "2", "amount": 20.0]
        let transaction = transactionMapper.mapTransaction(from: transactionData)
        XCTAssertEqual(transaction.id, "2")
        XCTAssertEqual(transaction.amount, 20.0)
        XCTAssertNil(transaction.description)
    }
    
    func testMapTransaction_withInvalidData() {
        // Test mapping a transaction with invalid data
        let transactionData = ["id": "3", "amount": "30.0", "description": 123]
        let transaction = transactionMapper.mapTransaction(from: transactionData)
        XCTAssertNil(transaction)
    }
    
    // Add more test cases to cover other functionalities of the TransactionMapper class
    
}
