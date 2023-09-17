import XCTest
@testable import CashBud

class ChartsViewModelTest: XCTestCase {
    var chartsViewModel: ChartsViewModel!
    
    override func setUp() {
        super.setUp()
        chartsViewModel = ChartsViewModel()
    }
    
    override func tearDown() {
        chartsViewModel = nil
        super.tearDown()
    }
    
    func testFetchChartData() {
        // Given
        let expectation = XCTestExpectation(description: "Fetch chart data")
        
        // When
        chartsViewModel.fetchChartData { result in
            // Then
            switch result {
            case .success(let chartData):
                XCTAssertNotNil(chartData)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Failed to fetch chart data with error: \(error.localizedDescription)")
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    // Add more unit tests for other methods and functionalities of the ChartsViewModel
    
}
