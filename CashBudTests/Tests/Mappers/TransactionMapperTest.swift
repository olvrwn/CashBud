//
//  TransactionMapperTest.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 09.09.23.
//

import Foundation
import XCTest
@testable import CashBud // manual: @

final class TransactionMapperTest: XCTestCase {
    
    func testMap() throws { // manual: f
        let mapper = TransactionMapper()
        let transaction = DummyData.Transaction.expense1 // manual: DummyData.Transaction.expense1
        let result = mapper.map(transaction: transaction) // error: call can throw, extraneous argument label
        XCTAssertEqual(result, transaction)
    } // manual
    
    func testMapError() throws { // manual: f
        let mapper = TransactionMapper()
        let transaction = DummyData.Transaction() // error: does not exist
        do {
            _ = try mapper.map(transaction: transaction) // error: extraneous argument type
            XCTFail("should throw")
        } // manual
    } // manual
} // manual
