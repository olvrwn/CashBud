// CashBudTests/CreateTransactionViewModelTest.swift

import XCTest
@testable import CashBud

class CreateTransactionViewModelTest: XCTestCase {
    
    var viewModel: CreateTransactionViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = CreateTransactionViewModel(transactionsManager: TransactionsManagerMock())
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testExample() {
        // Add your unit tests here
        // Test the functionality of the CreateTransactionViewModel
        // Make assertions to verify the expected results
    }
    
    // Add more unit tests as needed
    
}

extension CreateTransactionViewModelTest {
    
    // Helper methods or additional test cases can be added here
    
}
