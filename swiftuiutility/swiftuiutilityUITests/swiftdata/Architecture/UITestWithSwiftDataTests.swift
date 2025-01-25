//
//  UITestWithSwiftDataTests.swift
//  swiftuiutility
//
//  Created by ke on 1/24/25.
//

import XCTest
//https://www.hackingwithswift.com/quick-start/swiftdata/how-to-write-ui-tests-for-your-swiftdata-code
func testAppStartsEmpty() {
    let app = XCUIApplication()
    app.launch()

    XCTAssertEqual(app.cells.count, 0, "There should be 0 movies when the app is first launched.")
}


func testAppCreatingSamplesWorks() {
    let app = XCUIApplication()
    app.launch()

    app.buttons["Add Samples"].tap()

    XCTAssertEqual(app.cells.count, 3, "There should be 3 movies after adding sample data.")
}
