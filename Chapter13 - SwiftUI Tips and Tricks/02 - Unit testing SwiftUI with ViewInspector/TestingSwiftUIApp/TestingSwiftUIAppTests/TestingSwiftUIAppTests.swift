//
//  TestingSwiftUIAppTests.swift
//  TestingSwiftUIAppTests
//
//  Created by giordano scalzo on 04/06/2020.
//  Copyright © 2020 Giordano Scalzo. All rights reserved.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import TestingSwiftUIApp

extension ContentView: Inspectable { }

class TestingSwiftUIAppTests: XCTestCase {
    func testStartWithUSASelected() throws {
        let view = ContentView()

        try view.inspect().vStack().text(0)
        try view.inspect().vStack().hStack(1)
        try view.inspect().vStack().spacer(2)
        try view.inspect().vStack().text(3)

        let buttons = try view.inspect().vStack().hStack(1).forEach(0)
        
        XCTAssertEqual(try buttons.button(0).text().string(), "USA")
        XCTAssertEqual(try buttons.button(1).text().string(), "France")
        XCTAssertEqual(try buttons.button(2).text().string(), "Germany")
        XCTAssertEqual(try buttons.button(3).text().string(), "Italy")

        let country = try view.inspect().vStack().text(3)
        XCTAssertEqual(try country.string(), "USA")
    }
    
    func testSelectItaly() throws {
        var view = ContentView()

        let exp = view.on(\.didAppear) { view in
            XCTAssertEqual(try view.actualView().originCountry, 0)
            try view.actualView().inspect().vStack().hStack(1)
                        .forEach(0).button(3).tap()
            XCTAssertEqual(try view.actualView().originCountry, 3)
        }

        ViewHosting.host(view: view)
        wait(for: [exp], timeout: 0.1)
    }
}
