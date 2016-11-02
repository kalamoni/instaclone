//
//  InstaCloneUITests.swift
//  InstaCloneUITests
//
//  Created by Mohamed Saeed on 10/31/16.
//  Copyright © 2016 kalamoni. All rights reserved.
//

import XCTest

class InstaCloneUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    func testUnlock() {
        let app = XCUIApplication()
        XCTAssert(app.buttons["Skip"].exists)
        XCUIApplication().buttons["Skip"].tap()
    }
    
    
    func testFingerprint() {
        XCTAssert(XCUIApplication().buttons["touchid"].exists)
    }
    
    func testSkipFingerprint() {
        XCTAssert(XCUIApplication().buttons["Skip"].exists)
        
    }
    
    func testSkipToLogin() {
        let app = XCUIApplication()
        XCTAssert(app.buttons["Skip"].exists)
        app.buttons["Skip"].tap()
        XCTAssert(app.buttons["Skip"].exists)
        XCTAssert(XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.exists)
    }
    
    func testCamera() {
        let app = XCUIApplication()
        app.buttons["Skip"].tap()
        app.buttons["Login"].tap()
        app.tabBars.buttons["Camera"].tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.buttons["Camera"].tap()
        app.alerts["Warning"].buttons["OK"].tap()
    }
    
    func testLock() {
        let app = XCUIApplication()
        app.buttons["Skip"].tap()
        app.buttons["Login"].tap()
        let profileButton = app.tabBars.buttons["Profile"]
        profileButton.tap()
        XCTAssert(app.buttons["Lock"].exists)
        app.buttons["Lock"].tap()
        XCTAssert(app.buttons["Skip"].exists)
    
    }

    func testLogout() {
        let app = XCUIApplication()
        app.buttons["Skip"].tap()
        app.buttons["Login"].tap()
        let profileButton = app.tabBars.buttons["Profile"]
        profileButton.tap()
        XCTAssert(app.buttons["Logout"].exists)
        app.buttons["Logout"].tap()
        XCTAssert(app.buttons["Skip"].exists)
    }

}
