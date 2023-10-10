//
//  TransactionsListViewModelTest.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 10.09.23.
//

import XCTest
@testable import CashBud

class TransactionsListViewModelTest: XCTestCase {
    
    var transactionsManager: MockTransactionsManager!
    var viewModel: TransactionsListViewModel!
    
    override func setUp() {
        super.setUp()
        transactionsManager = MockTransactionsManager()
        viewModel = TransactionsListViewModel(transactionsListScreenType: .expenses, transactionsManager: transactionsManager)
    }
    
    override func tearDown() {
        transactionsManager = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testInit() {
        XCTAssertEqual(viewModel.transactionsListScreenType, .expenses)
        XCTAssertEqual(viewModel.transactionsListScreenTitle, "Expenses")
    }
    
    func testGetTransactions() {
        viewModel.getTransactions()
        let filteredTransactions = transactionsManager.transactions.filter { $0.type == .expense }
        let sortedTransactions = filteredTransactions.sorted { $0.costs > $1.costs }
        XCTAssertEqual(viewModel.transactions, sortedTransactions)
    }
    
    func testSortTransactions() {
        viewModel.sortTransactions()
        let sortedTransactions = transactionsManager.transactions.sorted { $0.costs > $1.costs }
        XCTAssertEqual(viewModel.transactions, sortedTransactions)
    }
    
    func testDeleteTransactionAndUpdate() {
        let initialCount = viewModel.transactions.count
        viewModel.deleteTransactionAndUpdate(at: [0])
        XCTAssertEqual(viewModel.transactions.count, initialCount - 1)
    }
    
    func testCalculateCostsPerMonth() {
        let transaction = Transaction(id: UUID(), type: .expense, category: .groceries, costs: 100, recurrence: .monthly)
        let costsPerMonth = viewModel.calculateCostsPerMonth(for: transaction)
        XCTAssertEqual(costsPerMonth, 100)
    }
    
    func testGetIconString() {
        let iconString = viewModel.getIconString(for: .groceries)
        XCTAssertEqual(iconString, "groceries")
    }
    
    func testMakeRecurrenceDescription() {
        let description = viewModel.makeRecurrenceDescription(recurrence: .monthly)
        XCTAssertEqual(description, "month")
    }
    
    func testErrorHandling() {
        transactionsManager.shouldReturnError = true
        viewModel.getTransactions()
        XCTAssertTrue(viewModel.errorOccured)
        XCTAssertTrue(viewModel.transactions.isEmpty)
    }
}
