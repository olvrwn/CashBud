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
        // Add your test case code here
    }
    
    func testViewModelInitialization() {
        // Test case code
        // Add your test case code here
    }
    
    func testViewModelUpdate() {
        // Test case code
        // Add your test case code here
    }
    
    func testViewModelData() {
        // Test case code
        // Add your test case code here
    }
    
    // Add more test cases as needed
    
}
