//
//  OverviewViewModelTest.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 02.09.23.
//

import Foundation
import XCTest
@testable import CashBud

enum OverviewViewModelTestError: Error {
    case calculateValuesFailureError
}

final class OverviewViewModelTest: XCTestCase {
    
    func testCalculateValues() {
        
        let manager = TransactionsManagerMock()
        manager.readFromDocumentsDirectoryResult = .success(DummyData.Transaction.arrayUnsorted)
        manager.calculateMonthlyCostsResponse = 10
        let viewModel = OverviewViewModel(transactionsManager: manager)
        
        viewModel.calculateValues()
        
        XCTAssertEqual(viewModel.revenue, 20)
        XCTAssertEqual(viewModel.expenses, 30)
        XCTAssertEqual(viewModel.errorOccured, false)
    }
    
    func testCalculateValuesFailure() {
        
        let manager = TransactionsManagerMock()
        manager.readFromDocumentsDirectoryResult = .failure(OverviewViewModelTestError.calculateValuesFailureError)
        let viewModel = OverviewViewModel(transactionsManager: manager)
        
        viewModel.calculateValues()
        
        XCTAssertEqual(viewModel.revenue, 0)
        XCTAssertEqual(viewModel.expenses, 0)
        XCTAssertEqual(viewModel.errorOccured, true)
    }
}
