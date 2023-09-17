import XCTest
@testable import CashBud

class ChartsViewModelTest: XCTestCase {
    
    var viewModel: ChartsViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = ChartsViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testFetchAndSortTransactions() {
        // TODO: Implement testFetchAndSortTransactions
    }
    
    func testFetchAndSortTransactionsFailure() {
        // TODO: Implement testFetchAndSortTransactionsFailure
    }
    
    func testCalculateMonthlyCosts() {
        // TODO: Implement testCalculateMonthlyCosts
    }
    
}
