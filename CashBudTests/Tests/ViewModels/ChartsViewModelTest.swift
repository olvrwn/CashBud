//
//  ChartsViewModelTest.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 10.09.23.
//

import XCTest
@testable import CashBud

class ChartsViewModelTest: XCTestCase {
    
    var viewModel: ChartsViewModel!
    var transactionsManagerMock: TransactionsManagerMock!
    
    override func setUp() {
        super.setUp()
        transactionsManagerMock = TransactionsManagerMock()
        viewModel = ChartsViewModel(transactionsManager: transactionsManagerMock)
    }
    
    override func tearDown() {
        viewModel = nil
        transactionsManagerMock = nil
        super.tearDown()
    }
    
    func testExample() {
        // Test case code
    }
    
    // Add more test cases as needed
    
}
