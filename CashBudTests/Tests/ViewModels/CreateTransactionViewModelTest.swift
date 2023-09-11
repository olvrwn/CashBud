//
//  CreateTransactionViewModelTest.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 09.09.23.
//

import Foundation
import XCTest
@testable import CashBud

final class CreateTransactionViewModelTest: XCTestCase {
    
    func testAddNewTransaction() throws {
        let manager = TransactionsManagerMock() // manual: let m
        manager.readFromDocumentsDirectoryResult = .success([Transaction]()) // manual: manager.r
        manager.writeToDocumentsDirectoryResult = .success(()) // manual: manager.w
        let viewModel = CreateTransactionViewModel(transactionsmanager: manager)
        viewModel.addNewTransaction(transaction: DummyData.TransactionCreationProcessModel.expense) // manual: DummyData.TransactionCreationProcessModel.expense
        XCTAssertEqual(viewModel.errorOccured, false)
    } // manual
    
    func testAddNewTransactionError() throws { // error occured that is not handled
        let manager = TransactionsManagerMock()
        manager.readFromDocumentsDirectoryResult = .success([Transaction]())
        manager.writeToDocumentsDirectoryResult = .failure(NSError())
        let viewModel = CreateTransactionViewModel(transactionsmanager: manager)
        viewModel.addNewTransaction(transaction: DummyData.TransactionCreationProcessModel.expense)
        XCTAssertEqual(viewModel.errorOccured, true)
    } // manual
    
    func testReadTransactions() throws { // manual: func testR
        let manager = TransactionsManagerMock() // manual: let m
        manager.readFromDocumentsDirectoryResult = .success([DummyData.Transaction.expense1])
        let viewModel = CreateTransactionViewModel(transactionsmanager: manager)
        let transactions = viewModel.readTransactions()
        XCTAssertEqual(transactions.count, 1)
        XCTAssertEqual(transactions[0], DummyData.Transaction.expense1)
    } // manual
    
    func testReadTransactionsError() throws { // error occured that is not handled
        let manager = TransactionsManagerMock()
        manager.readFromDocumentsDirectoryResult = .failure(NSError())
        let viewModel = CreateTransactionViewModel(transactionsmanager: manager)
        let transactions = viewModel.readTransactions()
        XCTAssertEqual(transactions.count, 0)
        XCTAssertEqual(viewModel.errorOccured, true)
    } // manual
    
    func testGetItconString() throws { // manual: func testGetIconStr
        let manager = TransactionsManagerMock() // manual: let m
        manager.getIconStringResponse = "credit"
        let viewModel = CreateTransactionViewModel(transactionsmanager: manager)
        XCTAssertEqual(viewModel.getIconString(for: DummyData.Transaction.expense1.category), "credit") // manual: DummyData.Transaction., ),
    } // manual
} // manual
