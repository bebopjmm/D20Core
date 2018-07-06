//
//  AdjustableValue.swift
//  D20Core
//
//  Created by John McCormick on 7/5/18.
//  Copyright © 2018 John McCormick. All rights reserved.
//

import Foundation

open class AdjustableValue {
    var base : Int
    var current : Int
    
    public init (baseValue : Int) {
        base = baseValue
        current = baseValue
    }

    public func baseValue() -> Int {
        return base
    }
    
    public func currentValue() -> Int {
        return current
    }
}
