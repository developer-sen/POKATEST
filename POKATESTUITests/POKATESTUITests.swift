//
//  POKATESTUITests.swift
//  POKATESTUITests
//
//  Created by Sanju-Maduwantha on 2023-12-21.
//

import XCTest

final class POKATESTUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNavigationTitleOfFactoryList() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        // Assert the navigation title
        let navigationBar = app.navigationBars["Factory List"]
        XCTAssert(navigationBar.exists)
        XCTAssertEqual(navigationBar.staticTexts["Factory List"].label, "Factory List")
    }
    
    func testNavigationOfDetailView() throws {
//        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        let pred = NSPredicate(format: "identifier == 'FactoryNameLabel'")
        let name = app.descendants(matching: .staticText).matching(pred).firstMatch
        XCTAssert(name.waitForExistence(timeout: 10))
        name.tap()
        let addressLabel = app.staticTexts["Address:"]
        XCTAssert(addressLabel.waitForExistence(timeout: 10))
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
