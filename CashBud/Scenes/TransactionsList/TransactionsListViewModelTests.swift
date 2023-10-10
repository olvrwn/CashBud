import XCTest
@testable import CashBud

class TransactionsListViewModelTests: XCTestCase {
    
    func testSortTransactions() {
        let viewModel = TransactionsListViewModel(transactionsListScreenType: .sum)
        
        let transaction1 = Transaction(id: "1", title: "Transaction 1", type: .expense, costs: 100.0, recurrence: .monthly, category: .groceries)
        let transaction2 = Transaction(id: "2", title: "Transaction 2", type: .revenue, costs: 200.0, recurrence: .monthly, category: .salary)
        let transaction3 = Transaction(id: "3", title: "Transaction 3", type: .expense, costs: 50.0, recurrence: .monthly, category: .rent)
        
        viewModel.transactions = [transaction2, transaction1, transaction3]
        
        viewModel.sortTransactions()
        
        let expectedTransactions = [transaction1, transaction3, transaction2]
        
        XCTAssertEqual(viewModel.transactions, expectedTransactions)
    }
}
