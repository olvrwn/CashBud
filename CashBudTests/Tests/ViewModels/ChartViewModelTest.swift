//
//  ChartViewModelTest.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 09.09.23.
//

import Foundation
import XCTest // manual: i
@testable import CashBud // manual: @

final class ChartsViewModelTest: XCTestCase {
    
    func testFetchAndSortTransactions() { // manual: func testFetchAndSor
        let manager = TransactionsManagerMock() // manual: l
        manager.readFromDocumentsDirectoryResult = .success([Transaction]()) // manual: manager.r
        let viewModel = ChartViewModel(transactionsManager: manager)
        viewModel.fetchAndDivideTransactions() // manual: viewModel.fetchAndDiv
        XCTAssertEqual(viewModel.transactions, [Transaction]()) // error: has no member transactions
    } // manual
} // manual
