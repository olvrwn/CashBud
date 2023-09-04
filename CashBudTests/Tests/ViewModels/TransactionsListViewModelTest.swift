//
//  TransactionsListViewModelTest.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 02.09.23.
//

import Foundation
import XCTest
@testable import CashBud

enum TransactionsListViewModelTestError: Error {
    
    case getTransactionsFailureError
    case deleteTransactionAndUpdateFailureError
}

final class TransactionsListViewModelTest: XCTestCase {
    
    func testGetTransactions() {
        
        let expensesManager = TransactionsManagerMock()
        let revenueManager = TransactionsManagerMock()
        let sumManager = TransactionsManagerMock()
        expensesManager.readFromDocumentsDirectoryResult = .success(DummyData.Transaction.arrayUnsorted)
        revenueManager.readFromDocumentsDirectoryResult = .success(DummyData.Transaction.arrayUnsorted)
        sumManager.readFromDocumentsDirectoryResult = .success(DummyData.Transaction.arrayUnsorted)
        expensesManager.sortTransactionResponse = DummyData.Transaction.expensesSorted
        revenueManager.sortTransactionResponse = DummyData.Transaction.revenuesSorted
        sumManager.sortTransactionResponse = DummyData.Transaction.arraySorted
        let expensesViewModel = TransactionsListViewModel(transactionsListScreenType: .expenses, transactionsManager: expensesManager)
        let revenueViewModel = TransactionsListViewModel(transactionsListScreenType: .revenue, transactionsManager: revenueManager)
        let sumViewModel = TransactionsListViewModel(transactionsListScreenType: .sum, transactionsManager: sumManager)
        
        expensesViewModel.getTransactions()
        revenueViewModel.getTransactions()
        sumViewModel.getTransactions()
        
        XCTAssertEqual(expensesViewModel.transactions, DummyData.Transaction.expensesSorted)
        XCTAssertEqual(revenueViewModel.transactions, DummyData.Transaction.revenuesSorted)
        XCTAssertEqual(sumViewModel.transactions, DummyData.Transaction.arraySorted)
        XCTAssertEqual(expensesViewModel.errorOccured, false)
        XCTAssertEqual(revenueViewModel.errorOccured, false)
        XCTAssertEqual(sumViewModel.errorOccured, false)
    }
    
    func testGetTransactionsFailure() {
        
        let manager = TransactionsManagerMock()
        manager.readFromDocumentsDirectoryResult = .failure(TransactionsListViewModelTestError.getTransactionsFailureError)
        let expensesViewModel = TransactionsListViewModel(transactionsListScreenType: .expenses, transactionsManager: manager)
        let revenueViewModel = TransactionsListViewModel(transactionsListScreenType: .revenue, transactionsManager: manager)
        let sumViewModel = TransactionsListViewModel(transactionsListScreenType: .sum, transactionsManager: manager)
        
        expensesViewModel.getTransactions()
        revenueViewModel.getTransactions()
        sumViewModel.getTransactions()
        
        XCTAssertEqual(expensesViewModel.transactions, [])
        XCTAssertEqual(revenueViewModel.transactions, [])
        XCTAssertEqual(sumViewModel.transactions, [])
        XCTAssertEqual(expensesViewModel.errorOccured, true)
        XCTAssertEqual(revenueViewModel.errorOccured, true)
        XCTAssertEqual(sumViewModel.errorOccured, true)
    }
    
    func testSortTransactions() {
        
        let expensesManager = TransactionsManagerMock()
        let revenueManager = TransactionsManagerMock()
        let sumManager = TransactionsManagerMock()
        expensesManager.sortTransactionResponse = DummyData.Transaction.expensesSorted
        revenueManager.sortTransactionResponse = DummyData.Transaction.revenuesSorted
        sumManager.sortTransactionResponse = DummyData.Transaction.arraySorted
        let expensesViewModel = TransactionsListViewModel(transactionsListScreenType: .expenses, transactionsManager: expensesManager)
        let revenueViewModel = TransactionsListViewModel(transactionsListScreenType: .revenue, transactionsManager: revenueManager)
        let sumViewModel = TransactionsListViewModel(transactionsListScreenType: .sum, transactionsManager: sumManager)
        
        expensesViewModel.sortTransactions()
        revenueViewModel.sortTransactions()
        sumViewModel.sortTransactions()
        
        XCTAssertEqual(expensesViewModel.transactions, DummyData.Transaction.expensesSorted)
        XCTAssertEqual(revenueViewModel.transactions, DummyData.Transaction.revenuesSorted)
        XCTAssertEqual(sumViewModel.transactions, DummyData.Transaction.arraySorted)
    }
    
    func testDeleteTransactionAndUpdate() {
        
        var successExpenses = DummyData.Transaction.expensesSorted
        var successRevenues = DummyData.Transaction.revenuesSorted
        var successSum = DummyData.Transaction.arraySorted
        successExpenses.removeFirst()
        successRevenues.removeFirst()
        successSum.removeFirst()
        
        let expensesManager = TransactionsManagerMock()
        let revenueManager = TransactionsManagerMock()
        let sumManager = TransactionsManagerMock()
        expensesManager.deleteResult = .success(())
        revenueManager.deleteResult = .success(())
        sumManager.deleteResult = .success(())
        expensesManager.readFromDocumentsDirectoryResult = .success(successExpenses)
        revenueManager.readFromDocumentsDirectoryResult = .success(successRevenues)
        sumManager.readFromDocumentsDirectoryResult = .success(successSum)
        expensesManager.sortTransactionResponse = successExpenses
        revenueManager.sortTransactionResponse = successRevenues
        sumManager.sortTransactionResponse = successSum
        let expensesViewModel = TransactionsListViewModel(transactionsListScreenType: .expenses, transactionsManager: expensesManager)
        let revenueViewModel = TransactionsListViewModel(transactionsListScreenType: .revenue, transactionsManager: revenueManager)
        let sumViewModel = TransactionsListViewModel(transactionsListScreenType: .sum, transactionsManager: sumManager)
        expensesViewModel.transactions = DummyData.Transaction.expensesSorted
        revenueViewModel.transactions = DummyData.Transaction.revenuesSorted
        sumViewModel.transactions = DummyData.Transaction.arraySorted
        
        expensesViewModel.deleteTransactionAndUpdate(at: IndexSet([0]))
        revenueViewModel.deleteTransactionAndUpdate(at: IndexSet([0]))
        sumViewModel.deleteTransactionAndUpdate(at: IndexSet([0]))
        
        XCTAssertEqual(expensesViewModel.transactions, successExpenses)
        XCTAssertEqual(revenueViewModel.transactions, successRevenues)
        XCTAssertEqual(sumViewModel.transactions, successSum)
        XCTAssertEqual(expensesViewModel.errorOccured, false)
        XCTAssertEqual(revenueViewModel.errorOccured, false)
        XCTAssertEqual(sumViewModel.errorOccured, false)
    }
    
    func testDeleteTransactionAndUpdateFailure() {
        
        let expensesManager = TransactionsManagerMock()
        let revenueManager = TransactionsManagerMock()
        let sumManager = TransactionsManagerMock()
        expensesManager.deleteResult = .failure(TransactionsListViewModelTestError.deleteTransactionAndUpdateFailureError)
        revenueManager.deleteResult = .failure(TransactionsListViewModelTestError.deleteTransactionAndUpdateFailureError)
        sumManager.deleteResult = .failure(TransactionsListViewModelTestError.deleteTransactionAndUpdateFailureError)
        expensesManager.readFromDocumentsDirectoryResult = .success(DummyData.Transaction.expensesSorted)
        revenueManager.readFromDocumentsDirectoryResult = .success(DummyData.Transaction.revenuesSorted)
        sumManager.readFromDocumentsDirectoryResult = .success(DummyData.Transaction.arraySorted)
        let expensesViewModel = TransactionsListViewModel(transactionsListScreenType: .expenses, transactionsManager: expensesManager)
        let revenueViewModel = TransactionsListViewModel(transactionsListScreenType: .revenue, transactionsManager: revenueManager)
        let sumViewModel = TransactionsListViewModel(transactionsListScreenType: .sum, transactionsManager: sumManager)
        expensesViewModel.transactions = DummyData.Transaction.expensesSorted
        revenueViewModel.transactions = DummyData.Transaction.revenuesSorted
        sumViewModel.transactions = DummyData.Transaction.arraySorted
        
        expensesViewModel.deleteTransactionAndUpdate(at: IndexSet([0]))
        revenueViewModel.deleteTransactionAndUpdate(at: IndexSet([0]))
        sumViewModel.deleteTransactionAndUpdate(at: IndexSet([0]))
        
        XCTAssertEqual(expensesViewModel.errorOccured, true)
        XCTAssertEqual(revenueViewModel.errorOccured, true)
        XCTAssertEqual(sumViewModel.errorOccured, true)
    }
    
    func testCalculateCostsPerMonth() {
        
        let manager = TransactionsManagerMock()
        manager.calculateMonthlyCostsResponse = 10
        let expensesViewModel = TransactionsListViewModel(transactionsListScreenType: .expenses, transactionsManager: manager)
        let revenueViewModel = TransactionsListViewModel(transactionsListScreenType: .revenue, transactionsManager: manager)
        let sumViewModel = TransactionsListViewModel(transactionsListScreenType: .sum, transactionsManager: manager)
        
        XCTAssertEqual(expensesViewModel.calculateCostsPerMonth(for: DummyData.Transaction.expense1), 10)
        XCTAssertEqual(revenueViewModel.calculateCostsPerMonth(for: DummyData.Transaction.revenue1), 10)
        XCTAssertEqual(sumViewModel.calculateCostsPerMonth(for: DummyData.Transaction.expense2), 10)
    }
    
    func testGetIconString() {
        
        let manager = TransactionsManagerMock()
        manager.getIconStringResponse = "someString"
        let expensesViewModel = TransactionsListViewModel(transactionsListScreenType: .expenses, transactionsManager: manager)
        let revenueViewModel = TransactionsListViewModel(transactionsListScreenType: .revenue, transactionsManager: manager)
        let sumViewModel = TransactionsListViewModel(transactionsListScreenType: .sum, transactionsManager: manager)
        
        XCTAssertEqual(expensesViewModel.getIconString(for: .others), "someString")
        XCTAssertEqual(revenueViewModel.getIconString(for: .others), "someString")
        XCTAssertEqual(sumViewModel.getIconString(for: .others), "someString")
    }
    
    func testMakeRecurrenceDescription() {
    
        let manager = TransactionsManagerMock()
        let expensesViewModel = TransactionsListViewModel(transactionsListScreenType: .expenses, transactionsManager: manager)
        let revenueViewModel = TransactionsListViewModel(transactionsListScreenType: .revenue, transactionsManager: manager)
        let sumViewModel = TransactionsListViewModel(transactionsListScreenType: .sum, transactionsManager: manager)
        
        XCTAssertEqual(expensesViewModel.makeRecurrenceDescription(recurrence: .weekly), "week")
        XCTAssertEqual(expensesViewModel.makeRecurrenceDescription(recurrence: .monthly), "month")
        XCTAssertEqual(expensesViewModel.makeRecurrenceDescription(recurrence: .quarterly), "quarter")
        XCTAssertEqual(expensesViewModel.makeRecurrenceDescription(recurrence: .yearly), "year")
        XCTAssertEqual(revenueViewModel.makeRecurrenceDescription(recurrence: .weekly), "week")
        XCTAssertEqual(revenueViewModel.makeRecurrenceDescription(recurrence: .monthly), "month")
        XCTAssertEqual(revenueViewModel.makeRecurrenceDescription(recurrence: .quarterly), "quarter")
        XCTAssertEqual(revenueViewModel.makeRecurrenceDescription(recurrence: .yearly), "year")
        XCTAssertEqual(sumViewModel.makeRecurrenceDescription(recurrence: .weekly), "week")
        XCTAssertEqual(sumViewModel.makeRecurrenceDescription(recurrence: .monthly), "month")
        XCTAssertEqual(sumViewModel.makeRecurrenceDescription(recurrence: .quarterly), "quarter")
        XCTAssertEqual(sumViewModel.makeRecurrenceDescription(recurrence: .yearly), "year")
    }
}
