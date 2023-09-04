//
//  LocalPersistenceServiceTest.swift
//  CashBudTests
//
//  Created by Oliver Dieke on 02.09.23.
//

import Foundation
import XCTest
@testable import CashBud

final class LocalPersistenceServiceTest: XCTestCase {
    
    private var sut: LocalPersistenceServiceProtocol!
    private let testingDirectory = "testing"
    
    override func setUp() {
        self.sut = LocalPersistenceService()
    }
    
    override func tearDown() {
        try! FileManager().removeItem(at: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(testingDirectory))
    }
    
    func testReadAndWrite() {
        
        let testString = "Hello, World!"
        
        XCTAssertNoThrow(try self.sut.writeToDocumentsDirectory(into: testingDirectory, data: testString))
        let result: String = try! self.sut.readFromDocumentsDirectory(from: self.testingDirectory)
        XCTAssertEqual(result, testString)
    }
}
