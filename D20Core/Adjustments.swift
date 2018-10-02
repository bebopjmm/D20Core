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

class Adjustment : Hashable {
    
    var value : Int
    let category : AdjustmentCategory
    let name : String
    
    init(name : String, modifierValue : Int, category : AdjustmentCategory) {
        self.name = name
        value = modifierValue
        self.category = category
        
    }
    
    static func == (lhs: Adjustment, rhs: Adjustment) -> Bool {
        return lhs.name == rhs.name && lhs.category == rhs.category
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(category)
    }
}

protocol AdjustmentListener {
    var trackedModifiers: Int {get set}
    mutating func adjustmentChanged(adjustment: Adjustment, modifierDelta: Int)
}
