import Foundation

class LocalPersistenceServiceMock: LocalPersistenceServiceProtocol {
    var result: Result<Any, Error>?
    var response: Any?

    // Implement functions that can throw or return errors
    func function1() throws -> Any {
        if let result = result {
            switch result {
            case .success(let value):
                return value
            case .failure(let error):
                throw error
            }
        } else {
            fatalError("Result not set for function1")
        }
    }

    func function2() throws -> Any {
        if let result = result {
            switch result {
            case .success(let value):
                return value
            case .failure(let error):
                throw error
            }
        } else {
            fatalError("Result not set for function2")
        }
    }

    // Implement other functions
    func function3() -> Any {
        if let response = response {
            return response
        } else {
            fatalError("Response not set for function3")
        }
    }

    func function4() -> Any {
        if let response = response {
            return response
        } else {
            fatalError("Response not set for function4")
        }
    }
}
