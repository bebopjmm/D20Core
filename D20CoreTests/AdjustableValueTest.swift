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

    init() {
        super.init(baseValue: 10)
    }
    
    func addModifier(newModifier: Modifier) {
        modifiers.insert(newModifier)
        recalculateCurrent()
    }
}

class AdjustableValueTests : XCTestCase {
    
    func testInitialization() {
        let adjustableValue = AdjustableValue(baseValue: 10)
        XCTAssertTrue(adjustableValue.currentValue == 10, "adjustable current equals base following initialization")
    }
    
    func testAddAdjustment() {
        let modifier = 5
        let adjustableValue = TestValue()
        adjustableValue.addModifier(newModifier: Modifier(name: "test", modifierValue: modifier, category: ModifierCategory.inherent))
        XCTAssertTrue(adjustableValue.currentValue == 15, "adjustable current updated following modifier change and recalc")
    }
}
