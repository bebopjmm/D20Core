//
//  AdjustmentListenerTest.swift
//  D20Core
//
//  Created by John McCormick on 9/30/18.
//  Copyright © 2018 John McCormick. All rights reserved.
//

import XCTest
import D20Core

class TestListener : ModifierListener {
    var trackedModifiers: Int = 0
    
    func modifierChanged(modifier: Modifier, valueDelta: Int) {
        print("notified of modifier change to \(modifier.name), delta = \(valueDelta)")
        trackedModifiers += valueDelta
    }
    
    func apply(modifier: Modifier) {
        print("applying and tracking modifier \(modifier.name) with initial value of \(modifier.value)")
        trackedModifiers += modifier.value
    }
}

class ModifiersTests : XCTestCase {

    func testModifierInitialization() {
        let testModifier = Modifier(name: "testModifier", modifierValue: 5, category: ModifierCategory.inherent)
        XCTAssertTrue(testModifier.value == 5 , "modifier value base equals initialized value")
        testModifier.value = 7
    }

    func testInitialization() {
        let listener : TestListener = TestListener()
        XCTAssertTrue(listener.trackedModifiers == 0 , "trackedModifiers equals initialized value")
    }
    
    func testChangingValues() {
        var listener : TestListener = TestListener()
        listener.modifierChanged(modifier: Modifier(name: "testModifier", modifierValue: 4, category: ModifierCategory.inherent), valueDelta: 4)
        XCTAssertTrue(listener.trackedModifiers == 4 , "trackedModifiers equals current+delta value")
        listener.modifierChanged(modifier: Modifier(name: "testModifier", modifierValue: 2, category: ModifierCategory.inherent), valueDelta: -2)
        XCTAssertTrue(listener.trackedModifiers == 2 , "trackedModifiers equals current+delta value")
    }
    
    func testAdjustmentSubscription() {
        let testModifier = Modifier(name: "testModifier", modifierValue: 5, category: ModifierCategory.inherent)
        var listener : TestListener = TestListener()
        let handler = testModifier.subscribe(listener: listener)
        testModifier.value = 7
        XCTAssertTrue(listener.trackedModifiers == testModifier.value , "trackedModifiers equals change in testModifier.value")
        handler.dispose()
    }
}
