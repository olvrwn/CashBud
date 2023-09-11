//
//  TransactionsListViewModelTest.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 09.09.23.
//

import Foundation
import XCTest // manual: i
@testable import CashBud

final class TransactionsListViewModelTest: XCTestCase {
    
    func testGetTransactions() throws {
        let manager = TransactionsManagerMock()
        manager.readFromDocumentsDirectoryResult = .success([DummyData.Transaction.expense1]) // manual: m, readFromDocumentsDirectoryResult
        manager.sortTransactionsResponse = [DummyData.Transaction.expense1]
        let viewModel = TransactionsListViewModel(transactionsListScreenType: TransactionsListScreenType.expenses, transactionsManager: manager)
        viewModel.getTransactions()
        XCTAssertEqual(viewModel.transactions.count, 1)
        XCTAssertEqual(viewModel.errorOccured, false)
    } // manual
    
    func testGetTransactionsError() throws { // error occured that is not handled
        let manager = TransactionsManagerMock()
        manager.readFromDocumentsDirectoryResult = .failure(NSError())
        let viewModel = TransactionsListViewModel(transactionsListScreenType: TransactionsListScreenType.expenses, transactionsManager: manager)
        viewModel.getTransactions()
        XCTAssertEqual(viewModel.transactions.count, 0)
        XCTAssertEqual(viewModel.errorOccured, true)
    } // manual
    
    func testGetIconString() throws {
        let manager = TransactionsManagerMock()
        manager.getIconStringResponse = "credit"
        let viewModel = TransactionsListViewModel(transactionsListScreenType: TransactionsListScreenType.expenses, transactionsManager: manager)
        XCTAssertEqual(viewModel.getIconString(for: DummyData.Transaction.expense1.category), "credit")
        XCTAssertEqual(viewModel.errorOccured, false)
    } // manual
    
    func testMakeRecurrenceDescription() throws { // manual: func testMakeRecurrenceDe
        let manager = TransactionsManagerMock()
        manager.calculateMonthlyCostsResponse = 100.0
        let viewModel = TransactionsListViewModel(transactionsListScreenType: TransactionsListScreenType.expenses, transactionsManager: manager)
        XCTAssertEqual(viewModel.makeRecurrenceDescription(recurrence: DummyData.Transaction.expense1.recurrence), "Monthly") // manual: recurrence:, .recurrence
        XCTAssertEqual(viewModel.errorOccured, false)
    } // manual
    
    func testCalculateCost() throws { // manual: func testCalculateC
        let manager = TransactionsManagerMock() // manual: let m
        manager.calculateMonthlyCostsResponse = 100.0
        let viewModel = TransactionsListViewModel(transactionsListScreenType: TransactionsListScreenType.expenses, transactionsManager: manager)
        let result = viewModel.calculateCostsPerMonth(for: DummyData.Transaction.expense1) // manual: let result = viewModel.calculateCostsPerMonth(for:
        XCTAssertEqual(result, 100.0)
    } // manual
    
    func testDeleteAndUpdateTransactions() throws { // manual: func testDeleteAnd, error occured that is not handled
        let manager = TransactionsManagerMock() // manual: let m
        manager.deleteResult = .success(()) // manual: manager.deleteR, ()
        let viewModel = TransactionsListViewModel(transactionsListScreenType: TransactionsListScreenType.expenses, transactionsManager: manager)
        viewModel.deleteTransactionAndUpdate(at: [0])
        XCTAssertEqual(viewModel.transactions.count, 0)
    }
     
    func testDeleteAndUpdateTransactionsError() throws { // manual: fun, error occured that is not handled
        let manager = TransactionsManagerMock()
        manager.deleteResult = .failure(NSError())
        let viewModel = TransactionsListViewModel(transactionsListScreenType: TransactionsListScreenType.expenses, transactionsManager: manager)
        viewModel.deleteTransactionAndUpdate(at: [0])
        XCTAssertEqual(viewModel.errorOccured, true)
        XCTAssertEqual(viewModel.transactions.count, 1)
    } // manual
    
    func testSortTransactions() throws { // manual func testSor
        let manager = TransactionsManagerMock()
        manager.sortTransactionsResponse = [DummyData.Transaction.expense1]
        let viewModel = TransactionsListViewModel(transactionsListScreenType: TransactionsListScreenType.expenses, transactionsManager: manager)
        viewModel.sortTransactions()
        XCTAssertEqual(viewModel.transactions.count, 1)
    } // manual
} // manual
