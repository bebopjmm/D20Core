//
//  AdjustmentListener.swift
//  D20Core
//
//  Created by John McCormick on 9/30/18.
//  Copyright © 2018 John McCormick. All rights reserved.
//

import Foundation

protocol AdjustmentListener {
    var trackedModifiers: Int {get set}
    mutating func adjustmentChanged(adjustment: Adjustment, modifierDelta: Int)
}
