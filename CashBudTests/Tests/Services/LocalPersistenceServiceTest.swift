//
//  LocalPersistenceServiceTest.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 10.09.23.
//

import XCTest
@testable import CashBud

class LocalPersistenceServiceTest: XCTestCase {
    
    func testLocalPersistenceService() {
        // Create a mock data object
        let data = Data()
        
        // Create a mock file URL
        let fileURL = URL(fileURLWithPath: "mockFile")
        
        // Create a mock file manager
        let fileManager = MockFileManager()
        
        // Create a mock persistence service
        let persistenceService = LocalPersistenceService(fileManager: fileManager)
        
        // Test saving data
        persistenceService.saveData(data, to: fileURL)
        XCTAssertTrue(fileManager.fileExists(atPath: fileURL.path))
        
        // Test loading data
        let loadedData = persistenceService.loadData(from: fileURL)
        XCTAssertEqual(loadedData, data)
        
        // Test deleting data
        persistenceService.deleteData(at: fileURL)
        XCTAssertFalse(fileManager.fileExists(atPath: fileURL.path))
    }
    
}
