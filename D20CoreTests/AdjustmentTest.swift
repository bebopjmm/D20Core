//
//  AdjustmentTest.swift
//  D20CoreTests
//
//  Created by John McCormick on 9/30/18.
//  Copyright © 2018 John McCormick. All rights reserved.
//

import XCTest
import D20Core

class AdjustmentTests : XCTestCase {
    
    func testInitialization() {
        let testAdjustment = Adjustment(name: "testAdjustment", modifierValue: 5, category: AdjustmentCategory.inherent)
        XCTAssertTrue(testAdjustment.value == 5 , "adjustment value base equals initialized value")
    }
}
