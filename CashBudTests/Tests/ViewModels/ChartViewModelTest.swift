//
//  ChartViewModelTest.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 02.09.23.
//

import Foundation
import XCTest
@testable import CashBud

enum ChartViewModelTestError: Error {
    case fetchAndSortTransactionsFailureError
}

final class ChartViewModelTest: XCTestCase {
    
    func testFetchAndSortTransactions() {
        
        let manager = TransactionsManagerMock()
        manager.readFromDocumentsDirectoryResult = .success(DummyData.Transaction.arrayUnsorted)
        let viewModel = ChartViewModel(transactionsManager: manager)
        
        viewModel.fetchAndDivideTransactions()
        
        XCTAssertEqual(viewModel.expensesData.count, DummyData.Transaction.expenses.count)
        XCTAssertEqual(Set(viewModel.expensesData), Set(DummyData.Transaction.expenses))
        XCTAssertEqual(viewModel.revenueData.count, DummyData.Transaction.revnues.count)
        XCTAssertEqual(Set(viewModel.revenueData), Set(DummyData.Transaction.revnues))
        XCTAssertEqual(viewModel.errorOccured, false)
    }
    
    func testFetchAndSortTransactionsFailure() {
        
        let manager = TransactionsManagerMock()
        manager.readFromDocumentsDirectoryResult = .failure(ChartViewModelTestError.fetchAndSortTransactionsFailureError)
        let viewModel = ChartViewModel(transactionsManager: manager)
        
        viewModel.fetchAndDivideTransactions()
        
        XCTAssertEqual(viewModel.expensesData, [])
        XCTAssertEqual(viewModel.revenueData, [])
        XCTAssertEqual(viewModel.errorOccured, true)
    }
    
    func testCalculateMonthlyCosts() {
        
        let expectedValue = 10.0
        
        let manager = TransactionsManagerMock()
        manager.calculateMonthlyCostsResponse = expectedValue
        let viewModel = ChartViewModel(transactionsManager: manager)
        
        let response = viewModel.calculateMonthlyCosts(transaction: DummyData.Transaction.expense1)
        
        XCTAssertEqual(response, expectedValue)
    }
}
