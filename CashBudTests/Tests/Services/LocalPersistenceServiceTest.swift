//
//  LocalPersistenceServiceTest.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 09.09.23.
//

import Foundation
import XCTest
@testable import CashBud

final class LocalPersistenceServiceTest: XCTestCase {
    
    func testSave() throws {
        let service = LocalPersistenceService()
        let transaction = DummyData.Transaction.expense1 // manual: DummyData.Transaction.expense1
        XCTAssertNoThrow(try service.writeToDocumentsDirectory(into: "test", data: transaction))
    } // manual
    
    func testRead() throws {
        let service = LocalPersistenceService()
        let transaction: Transaction = try service.readFromDocumentsDirectory(from: "test") // manual: : Transaction
        XCTAssertEqual(transaction, DummyData.Transaction.expense1)
    } // manual
} // manual
