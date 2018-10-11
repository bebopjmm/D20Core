//
//  AdjustableValueTest.swift
//  D20CoreTests
//
//  Created by John McCormick on 7/6/18.
//  Copyright © 2018 John McCormick. All rights reserved.
//

import XCTest
import D20Core

class TestValue : ModifiableValue {

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
        let modifiableValue = ModifiableValue(baseValue: 10)
        XCTAssertTrue(modifiableValue.currentValue == 10, "modifiable current equals base following initialization")
    }
    
    func testAddAdjustment() {
        let modifier = 5
        let modifiableValue = TestValue()
        modifiableValue.addModifier(newModifier: Modifier(name: "test", modifierValue: modifier, category: ModifierCategory.inherent))
        XCTAssertTrue(modifiableValue.currentValue == 15, "modifiable current updated following modifier change and recalc")
    }
}
