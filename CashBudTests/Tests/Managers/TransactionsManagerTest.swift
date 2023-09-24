//
//  TransactionsManagerTest.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 10.09.23.
//

import XCTest
@testable import CashBud

class TransactionsManagerTest: XCTestCase {
    
    var transactionsManager: TransactionsManager!
    
    override func setUp() {
        super.setUp()
        transactionsManager = TransactionsManager()
    }
    
    override func tearDown() {
        transactionsManager = nil
        super.tearDown()
    }
    
    func testReadFromDocumentsDirectory() {
        // Test reading from documents directory
        // ...
    }
    
    func testCalculateMonthlyCosts() {
        // Test calculating monthly costs
        // ...
    }
    
    // Add more test cases for different scenarios and edge cases
    
}
