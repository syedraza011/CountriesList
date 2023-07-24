//
//  CountriesListTests.swift
//  CountriesListTests
//
//  Created by Syed Raza on 7/22/23.
//

import XCTest
import Combine
@testable import CountriesList
enum FileName: String {
    case realDataFile, missingDataFile, emptyDataFile
}

final class CountriesListTests: XCTestCase {
    
    var cancellables: Set<AnyCancellable> = []
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func test_Should_pass_for_Data() async throws {
        let viewModel = CountriesViewModel(service: CountriesServiceProtocol(fileName: .realDataFile))
        let exp = XCTestExpectation(description: "Expected to pass test ")
        var cancellables = Set<AnyCancellable>() // Declare the cancellables variable

        await viewModel.getCountries()
        viewModel.$countries
            .sink { country in
                XCTAssertFalse(country.CountryResponse.isEmpty, "Should Not be Empty")
                exp.fulfill()
            }
            .store(in: &cancellables)

        await fulfillment(of: [exp], timeout: 5.0)
    }

    
}



class MockCountriesService: CountriesServiceProtocol {
    let fileName: FileName
    
    init (fileName: FileName){
        self.fileName = fileName
    }
    func load (_ file: String) -> URL? {
        return Bundle (for: type(of: self)).url(forResource: file, withExtension: "json")
    }
    
    func fetchCountries() async throws -> [CountryResponse] {
        guard let url = load(fileName.rawValue) else { throw APIError.invalidUrl}
        let data = try! Data(contentsOf: url)
        do {
            return try JSONDecoder().decode([CountryResponse].self,from: data)
        }catch {
            throw APIError.emptyData
        }
    }
}
