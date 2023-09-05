//
//  TransactionMapperTest.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 03.09.23.
//

import Foundation
import XCTest
@testable import CashBud

final class TransactionMapperTest: XCTestCase {
    
    let mapper = TransactionMapper()
    
    func testTransactionCreationModel2Transaction() throws {
        
        let result = try self.mapper.map(DummyData.TransactionCreationProcessModel.expense)
        
        XCTAssertEqual(result.type, .expense)
        XCTAssertEqual(result.costs, -49)
        XCTAssertEqual(result.recurrence, .monthly)
        XCTAssertEqual(result.category, .mobility)
        XCTAssertEqual(result.title, "D-Ticket")
    }
    
    func testTransactionCreationModel2TransactionFailure() {
        
        let transactionCreationProcessModel = TransactionCreationProcessModel()
        
        XCTAssertThrowsError(try self.mapper.map(transactionCreationProcessModel)) {
            XCTAssertEqual($0 as? TransactionMapperError, TransactionMapperError.missingParameter)
        }
    }
}
