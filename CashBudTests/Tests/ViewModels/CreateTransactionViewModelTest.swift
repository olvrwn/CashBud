//
//  CreateTransactionViewModelTest.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 02.09.23.
//

import Foundation
import XCTest
@testable import CashBud

enum CreateTransactionViewModelTestError: Error {
    
    case addNewTransactionFailureError
    case readTransactionFailureError
}

final class CreateTransactionViewModelTest: XCTestCase {
    
    func testAddNewTransaction() {
        
        let manager = TransactionsManagerMock()
        manager.writeToDocumentsDirectoryResult = .success(())
        manager.readFromDocumentsDirectoryResult = .success(DummyData.Transaction.arraySorted)
        let viewModel = CreateTransactionViewModel(transactionsmanager: manager)
        
        viewModel.addNewTransaction(transaction: DummyData.TransactionCreationProcessModel.expense)
        
        XCTAssertEqual(viewModel.errorOccured, false)
    }
    
    func testAddNewTransactionFailure() {
        
        let manager = TransactionsManagerMock()
        manager.writeToDocumentsDirectoryResult = .failure(CreateTransactionViewModelTestError.addNewTransactionFailureError)
        manager.readFromDocumentsDirectoryResult = .success(DummyData.Transaction.arraySorted)
        let viewModel = CreateTransactionViewModel(transactionsmanager: manager)
        
        viewModel.addNewTransaction(transaction: DummyData.TransactionCreationProcessModel.expense)
        
        XCTAssertEqual(viewModel.errorOccured, true)
    }
    
    func testReadTransactions() {
        
        let manager = TransactionsManagerMock()
        manager.readFromDocumentsDirectoryResult = .success(DummyData.Transaction.arraySorted)
        let viewModel = CreateTransactionViewModel(transactionsmanager: manager)
                
        XCTAssertEqual(viewModel.readTransactions(), DummyData.Transaction.arraySorted)
        XCTAssertEqual(viewModel.errorOccured, false)
    }
    
    func testReadTransactionsFailure() {
        
        let manager = TransactionsManagerMock()
        manager.readFromDocumentsDirectoryResult = .failure(CreateTransactionViewModelTestError.readTransactionFailureError)
        let viewModel = CreateTransactionViewModel(transactionsmanager: manager)
        
        XCTAssertEqual(viewModel.readTransactions(), [])
        XCTAssertEqual(viewModel.errorOccured, true)
    }
    
    func testGetIconString() {
        
        let manager = TransactionsManagerMock()
        manager.getIconStringResponse = "someString"
        let viewModel = CreateTransactionViewModel(transactionsmanager: manager)
        
        XCTAssertEqual(viewModel.getIconString(for: .others), "someString")
    }
}
