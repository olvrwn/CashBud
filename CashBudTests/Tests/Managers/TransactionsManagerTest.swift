//
//  TransactionsManagerTest.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 09.09.23.
//

import Foundation
import XCTest // manuell: imp
@testable import CashBud // manuell: @

final class TransactionsManagerTest: XCTestCase {

    func testCalculateMonthlyCosts() throws {
        
        let manager = TransactionsManager(localPersistenceService: LocalPersistenceServiceMock()) // manual: let, l (for parameter)
        
        XCTAssertEqual(manager.calculateMonthlyCosts(recurrence: .monthly, costs: 100), 100)
        XCTAssertEqual(manager.calculateMonthlyCosts(recurrence: .quarterly, costs: 100), 100) // manual: X
        XCTAssertEqual(manager.calculateMonthlyCosts(recurrence: .weekly, costs: 100), 100) // manual: X
        XCTAssertEqual(manager.calculateMonthlyCosts(recurrence: .yearly, costs: 100), 100) // manual: X
    }
    
    func testSortTransactions() throws {
        
        let manager = TransactionsManager(localPersistenceService: LocalPersistenceServiceMock()) // manual: l
        
        XCTAssertEqual(manager.sortTransactions(DummyData.Transaction.arrayUnsorted), DummyData.Transaction.arraySorted) // manual: DummyData.Transaction.arrayUnsorted, DummyData.T
    } // manual
    
    func testGetIconString() throws {
        
        let manager = TransactionsManager(localPersistenceService: LocalPersistenceServiceMock())
        
        XCTAssertEqual(manager.getIconString(transactionCategory: .credit), "dollarsign.arrow.circlepath") // manuell: .credit, dollarsign.arrow.circ -> kann zwar den string predicten, weil es SFSymbol ist, aber kennt den Grund dafür eben nicht
    } // manual
}
