//
//  Adjustment.swift
//  D20Core
//
//  Created by John McCormick on 9/30/18.
//  Copyright © 2018 John McCormick. All rights reserved.
//

import Foundation

enum AdjustmentCategory {
    case inherent, equipment, effect
}

struct Adjustment : Hashable {
    var value : Int
    let category : AdjustmentCategory
    let name : String
    
    init(name : String, modifierValue : Int, category : AdjustmentCategory) {
        self.name = name
        value = modifierValue
        self.category = category
    }
}
