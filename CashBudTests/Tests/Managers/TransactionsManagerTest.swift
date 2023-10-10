//
//  TransactionsManagerTest.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 10.09.23.
//

import Foundation
import XCTest
@testable import CashBud

class TransactionsManagerTest: XCTestCase {
    
    func testCalculateMonthlyCosts() {
        
        let transactionsManager = TransactionsManager()
        let result = transactionsManager.calculateMonthlyCosts(recurrence: .monthly, costs: 0.0)
        XCTAssertEqual(result, 0.0)
        
        let result2 = transactionsManager.calculateMonthlyCosts(recurrence: .quarterly, costs: 0.0)
        XCTAssertEqual(result2, 0.0)
        
        let result3 = transactionsManager.calculateMonthlyCosts(recurrence: .weekly, costs: 0.0)
        XCTAssertEqual(result3, 0.0)
        
        let result4 = transactionsManager.calculateMonthlyCosts(recurrence: .yearly, costs: 0.0)
        XCTAssertEqual(result4, 0.0)
        
        let result5 = transactionsManager.calculateMonthlyCosts(recurrence: .monthly, costs: 100.0)
        XCTAssertEqual(result5, 100.0)
        
        let result6 = transactionsManager.calculateMonthlyCosts(recurrence: .quarterly, costs: 300.0)
        XCTAssertEqual(result6, 100.0)
        
        let result7 = transactionsManager.calculateMonthlyCosts(recurrence: .weekly, costs: 100.0)
        XCTAssertEqual(result7, 435.0)
        
        let result8 = transactionsManager.calculateMonthlyCosts(recurrence: .yearly, costs: 1200.0)
        XCTAssertEqual(result8, 100.0)
    }
    
    func testSortTransactions() {
     
        let transactionsManager = TransactionsManager()
        let result = transactionsManager.sortTransactions([])
        XCTAssertEqual(result, [])
        
        let result2 = transactionsManager.sortTransactions([.weekly])
    }
}
