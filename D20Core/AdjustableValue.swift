//
//  AdjustableValue.swift
//  D20Core
//
//  Created by John McCormick on 7/5/18.
//  Copyright © 2018 John McCormick. All rights reserved.
//

import Foundation

class AdjustableValue {
    private var baseValue : Int
    var currentValue : Int
    var modifiers = Set<Modifier>()

    init(baseValue: Int) {
        self.baseValue = baseValue
        currentValue = baseValue
    }

    func recalculateCurrent() {
        currentValue = baseValue
        for modifier in modifiers {
            currentValue += modifier.value
        }
    }
    
}

