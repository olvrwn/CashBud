// TransactionMapperTest.swift

import XCTest
@testable import CashBud

class TransactionMapperTest: XCTestCase {
    
    func testMapTransaction() {
        // Test case 1
        let transactionData1: [String: Any] = [
            "id": 1,
            "amount": 100.0,
            "date": "2022-01-01"
        ]
        let transaction1 = TransactionMapper.mapTransaction(from: transactionData1)
        XCTAssertEqual(transaction1.id, 1)
        XCTAssertEqual(transaction1.amount, 100.0)
        XCTAssertEqual(transaction1.date, "2022-01-01")
        
        // Test case 2
        let transactionData2: [String: Any] = [
            "id": 2,
            "amount": 200.0,
            "date": "2022-01-02"
        ]
        let transaction2 = TransactionMapper.mapTransaction(from: transactionData2)
        XCTAssertEqual(transaction2.id, 2)
        XCTAssertEqual(transaction2.amount, 200.0)
        XCTAssertEqual(transaction2.date, "2022-01-02")
    }
    
}
