//
//  AdjustableValueTest.swift
//  D20CoreTests
//
//  Created by John McCormick on 7/6/18.
//  Copyright © 2018 John McCormick. All rights reserved.
//

import XCTest
import D20Core

class AdjustableValueTests : XCTestCase {
    
    func testInitialization() {
        let adjustableValue = AdjustableValue(baseValue: 10)
        XCTAssertTrue(adjustableValue.baseValue() == 10, "adjustable value base equals initialized value")
        XCTAssertTrue(adjustableValue.currentValue() == adjustableValue.baseValue(), "adjustable current equals base following initialization")
    }
}
