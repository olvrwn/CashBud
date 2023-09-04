//
//  TransactionsManagerTest.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 02.09.23.
//

import Foundation
import XCTest
@testable import CashBud

enum TransactionsManagerTestError: Error {
    
    case readFromDocumentsDirectoryFailureError
    case writeToDocumentsDirectoryFailureError
    case deleteFailureError
}

final class TransactionsManagerTest: XCTestCase {
    
    func testReadFromDocumentsDirectory() throws {
        
        let localPersistenceService = LocalPersistenceServiceMock()
        localPersistenceService.readFromDocumentsDirectoryResult = .success(DummyData.Transaction.arraySorted)
        let manager = TransactionsManager(localPersistenceService: localPersistenceService)
        
        let result: [Transaction] = try manager.readFromDocumentsDirectory(from: "")
        
        XCTAssertEqual(result, DummyData.Transaction.arraySorted)
    }
    
    func testReadFromDocumentsDirectoryFailure() {
        
        let localPersistenceService = LocalPersistenceServiceMock()
        localPersistenceService.readFromDocumentsDirectoryResult = .failure(TransactionsManagerTestError.readFromDocumentsDirectoryFailureError)
        let manager = TransactionsManager(localPersistenceService: localPersistenceService)
        
        do {
            let _: String = try manager.readFromDocumentsDirectory(from: "")
            XCTFail("No error thrown")
        } catch {
            XCTAssertEqual(error as? TransactionsManagerTestError, TransactionsManagerTestError.readFromDocumentsDirectoryFailureError)
        }
    }
    
    func testWriteToDocumentsDirectory() {
        
        let localPersistenceService = LocalPersistenceServiceMock()
        localPersistenceService.writeToDocumentsDirectoryResult = .success(())
        let manager = TransactionsManager(localPersistenceService: localPersistenceService)
        
        XCTAssertNoThrow(try manager.writeToDocumentsDirectory(into: "", data: Data()))
    }
    
    func testWriteToDocumentsDirectoryFailure() {
        
        let localPersistenceService = LocalPersistenceServiceMock()
        localPersistenceService.writeToDocumentsDirectoryResult = .failure(TransactionsManagerTestError.writeToDocumentsDirectoryFailureError)
        let manager = TransactionsManager(localPersistenceService: localPersistenceService)
        
        XCTAssertThrowsError(try manager.writeToDocumentsDirectory(into: "", data: Data())) {
            XCTAssertEqual($0 as? TransactionsManagerTestError, TransactionsManagerTestError.writeToDocumentsDirectoryFailureError)
        }
    }
    
    func testDelete() {
        
        let localPersistenceService = LocalPersistenceServiceMock()
        localPersistenceService.readFromDocumentsDirectoryResult = .success(DummyData.Transaction.arraySorted)
        localPersistenceService.writeToDocumentsDirectoryResult = .success(())
        let manager = TransactionsManager(localPersistenceService: localPersistenceService)
        
        XCTAssertNoThrow(try manager.delete(id: UUID()))
    }
    
    func testDeleteFailure() {
        
        let localPersistenceService = LocalPersistenceServiceMock()
        localPersistenceService.readFromDocumentsDirectoryResult = .failure(TransactionsManagerTestError.deleteFailureError)
        localPersistenceService.writeToDocumentsDirectoryResult = .failure(TransactionsManagerTestError.deleteFailureError)
        let manager = TransactionsManager(localPersistenceService: localPersistenceService)
        
        XCTAssertThrowsError(try manager.delete(id: UUID())) {
            XCTAssertEqual($0 as? TransactionsManagerTestError, TransactionsManagerTestError.deleteFailureError)
        }
    }
    
    func testCalculateMonthlyCosts() {
        
        let manager = TransactionsManager(localPersistenceService: LocalPersistenceServiceMock())
        
        XCTAssertEqual(manager.calculateMonthlyCosts(recurrence: .weekly, costs: 10), 43.5)
        XCTAssertEqual(manager.calculateMonthlyCosts(recurrence: .monthly, costs: 10), 10)
        XCTAssertEqual(manager.calculateMonthlyCosts(recurrence: .quarterly, costs: 30), 10)
        XCTAssertEqual(manager.calculateMonthlyCosts(recurrence: .yearly, costs: 120), 10)
    }
    
    func testSortTransactions() {
        
        let manager = TransactionsManager(localPersistenceService: LocalPersistenceServiceMock())
        
        XCTAssertEqual(manager.sortTransactions(DummyData.Transaction.arrayUnsorted), DummyData.Transaction.arraySorted)
    }
    
    func testGetIconString() {
        
        let manager = TransactionsManager(localPersistenceService: LocalPersistenceServiceMock())
        
        XCTAssertEqual(manager.getIconString(transactionCategory: .credit), "dollarsign.arrow.circlepath")
        XCTAssertEqual(manager.getIconString(transactionCategory: .education), "graduationcap")
        XCTAssertEqual(manager.getIconString(transactionCategory: .entertainment), "popcorn")
        XCTAssertEqual(manager.getIconString(transactionCategory: .furnishings), "lamp.ceiling")
        XCTAssertEqual(manager.getIconString(transactionCategory: .healthCare), "cross.case")
        XCTAssertEqual(manager.getIconString(transactionCategory: .insurance), "doc.text")
        XCTAssertEqual(manager.getIconString(transactionCategory: .mobility), "car")
        XCTAssertEqual(manager.getIconString(transactionCategory: .others), "ellipsis")
        XCTAssertEqual(manager.getIconString(transactionCategory: .primaryCare), "bolt")
        XCTAssertEqual(manager.getIconString(transactionCategory: .rent), "house")
        XCTAssertEqual(manager.getIconString(transactionCategory: .saveUp), "dollarsign.circle")
        XCTAssertEqual(manager.getIconString(transactionCategory: .socialBenefits), "person.2")
        XCTAssertEqual(manager.getIconString(transactionCategory: .work), "person.text.rectangle")
    }
}
