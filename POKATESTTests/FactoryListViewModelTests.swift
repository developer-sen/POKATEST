//
//  FactoryListViewModelTests.swift
//  POKATESTTests
//
//  Created by Sanju-Maduwantha on 2023-12-21.
//
@testable import POKATEST
import XCTest
import Combine

final class FactoryListViewModelTests: XCTestCase {
    
    // Mock the FactoryAPI to control responses
    private var mockFactoryAPI: MockFactoryAPI!
    
    // ViewModel instance under test
    private var viewModel: FactoryListViewModel!
    
    @MainActor override func setUpWithError() throws {
        try super.setUpWithError()
        mockFactoryAPI = MockFactoryAPI()
        viewModel = FactoryListViewModel()
        viewModel.factoryAPI = mockFactoryAPI
    }
    
    override func tearDownWithError() throws {
        mockFactoryAPI = nil
        viewModel = nil
        try super.tearDownWithError()
    }
    
    @MainActor func test_refreshFactoryList() throws {
        viewModel.refreshFactoryList()
        XCTAssertEqual(viewModel.next, "")
        XCTAssertFalse(viewModel.lastPageRetrieved)
    }
}
