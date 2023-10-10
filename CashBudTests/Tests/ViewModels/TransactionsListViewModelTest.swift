//
//  TransactionsListViewModelTest.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 10.09.23.
//

import Foundation
@testable import CashBud
import XCTest

final class TransactionsListViewModelTest: XCTestCase {
    
    func testSortTransactions() {
        
        let transactionsManagerMock = TransactionsManagerMock()
        transactionsManagerMock.sortTransactionResponse = DummyData.Transaction.arrayUnsorted
        
        let sut = TransactionsListViewModel(
            transactionsListScreenType: .sum,
            transactionsManager: transactionsManagerMock
        )
        let transactions = DummyData.Transaction.arraySorted
        
        sut.sortTransactions()
        
        XCTAssertEqual(sut.transactions, transactions)
    }
}
