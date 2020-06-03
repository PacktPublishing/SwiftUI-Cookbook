//
//  SnapshotTestingAppTests.swift
//  SnapshotTestingAppTests
//
//  Created by giordano scalzo on 01/06/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import XCTest
import SnapshotTesting
import SwiftUI
@testable import SnapshotTestingApp


extension Snapshotting where Value:View, Format == UIImage {
    public static func image(
    on config: ViewImageConfig) -> Snapshotting {
        Snapshotting<UIViewController, UIImage>.image(on: config).pullback(UIHostingController.init(rootView:))
    }
}

class PointFreeAppTests: XCTestCase {
    override class func setUp() {
        diffTool = "ksdiff"
    }
    func testContentView() throws {
        assertSnapshot(matching: ContentView(), as: .image(on: .iPhoneX))
    }
}

