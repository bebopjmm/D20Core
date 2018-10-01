//
//  AdjustableValueTest.swift
//  D20CoreTests
//
//  Created by John McCormick on 7/6/18.
//  Copyright © 2018 John McCormick. All rights reserved.
//

import XCTest
import D20Core

class TestValue : AdjustableValue {
    var adjustments: Set<Adjustment>
    
    let baseValue = 10
    var currentValue : Int

    init() {
        currentValue = baseValue
        adjustments = Set<Adjustment>()
    }
    
    func addAdjustment(newAdjustment: Adjustment) {
        adjustments.insert(newAdjustment)
        recalculateCurrent()
    }

    func recalculateCurrent() {
        currentValue = baseValue
        for adjustment in adjustments {
            currentValue += adjustment.value
        }
    }
}

class AdjustableValueTests : XCTestCase {
    
    func testInitialization() {
        let adjustableValue = TestValue()
        XCTAssertTrue(adjustableValue.baseValue == 10, "adjustable value base equals initialized value")
        XCTAssertTrue(adjustableValue.currentValue == adjustableValue.baseValue, "adjustable current equals base following initialization")
    }
    
    func testAddAdjustment() {
        let modifier = 5
        let adjustableValue = TestValue()
        adjustableValue.addAdjustment(newAdjustment: Adjustment(name: "test", modifierValue: modifier, category: AdjustmentCategory.inherent))
        XCTAssertTrue(adjustableValue.currentValue == adjustableValue.baseValue + modifier, "adjustable current updated following modifier change and recalc")
    }
}
