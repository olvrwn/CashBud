//
//  OverviewViewModelTest.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 09.09.23.
//

import Foundation
import XCTest
@testable import CashBud

final class OverviewViewModelTest: XCTestCase {
    
    func testCalculateValues() { // manual: func testCalculateValues(), error occured that is not handled
        
        let manager = TransactionsManagerMock() // manual: let manager = Tra, "s" in mock name
        manager.calculateMonthlyCostsResponse = 100.0 // manual: manager.calculateM
        let viewModel = OverviewViewModel(transactionsManager: manager) // manual: l
        viewModel.calculateValues() // manual: v
        XCTAssertEqual(viewModel.sum, 100.0) // manual: X
    } // manual
} // manual
