//
//  LocalPersistenceService.swift
//  CashBud
//
//  Created by Oliver Dieke on 29.07.23.
//

import Foundation

protocol LocalPersistenceServiceProtocol {
    
    func writeToDocumentsDirectory<T: Codable>(into filename: String, data: T) throws
    func readFromDocumentsDirectory<T: Codable>(from filename: String) throws -> T
}

// MARK: - LocalPersistenceService

final class LocalPersistenceService: LocalPersistenceServiceProtocol {
    
    func writeToDocumentsDirectory(into filename: String, data: some Codable) throws {
        try self.encodeJSON(data).write(to: self.getDocumentsDirectory(for: filename))
    }

    func readFromDocumentsDirectory<T: Codable>(from filename: String) throws -> T  {
        try self.decodeJSON(data: Data(contentsOf: self.getDocumentsDirectory(for: filename)))
    }
}

// MARK: - Private Functions

private extension LocalPersistenceService {
    
    private func getDocumentsDirectory(for filename: String) -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(filename)
    }
    
    private func encodeJSON(_ model: some Codable) throws -> Data {
        try JSONEncoder().encode(model)
    }

    private func decodeJSON<T: Codable>(data: Data) throws -> T {
        try JSONDecoder().decode(T.self, from: data)
    }
}
