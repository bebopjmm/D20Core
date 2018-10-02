//
//  AdjustmentListenerTest.swift
//  D20Core
//
//  Created by John McCormick on 9/30/18.
//  Copyright © 2018 John McCormick. All rights reserved.
//

import XCTest
import D20Core

class TestListener : AdjustmentListener {
    var trackedModifiers: Int = 0

    func adjustmentChanged(adjustment: Adjustment, modifierDelta: Int) {
        trackedModifiers += modifierDelta
    }
}

class AdjustmentsTests : XCTestCase {

    func testAdjustmentInitialization() {
        let testAdjustment = Adjustment(name: "testAdjustment", modifierValue: 5, category: AdjustmentCategory.inherent)
        XCTAssertTrue(testAdjustment.value == 5 , "adjustment value base equals initialized value")
    }

    func testInitialization() {
        let listener : TestListener = TestListener()
        XCTAssertTrue(listener.trackedModifiers == 0 , "trackedModifiers equals initialized value")
    }
    
    func testChangingValues() {
        var listener : TestListener = TestListener()
        listener.adjustmentChanged(adjustment: Adjustment(name: "a", modifierValue: 4, category: AdjustmentCategory.inherent), modifierDelta: 4)
        XCTAssertTrue(listener.trackedModifiers == 4 , "trackedModifiers equals current+delta value")
        listener.adjustmentChanged(adjustment: Adjustment(name: "a", modifierValue: 2, category: AdjustmentCategory.inherent), modifierDelta: -2)
        XCTAssertTrue(listener.trackedModifiers == 2 , "trackedModifiers equals current+delta value")
    }
}
