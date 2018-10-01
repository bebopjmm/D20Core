//
//  AdjustableValue.swift
//  D20Core
//
//  Created by John McCormick on 7/5/18.
//  Copyright © 2018 John McCormick. All rights reserved.
//

import Foundation

protocol AdjustableValue {
    var baseValue : Int {get}
    var currentValue : Int {get set}
    func recalculateCurrent()
}

