//
//  Ability.swift
//  D20Core
//
//  Created by John McCormick on 7/5/18.
//  Copyright © 2018 John McCormick. All rights reserved.
//

import Foundation

enum Ability : String {
    case strength = "STR"
    case dexterity = "DEX"
    case constitution = "CON"
    case intelligence = "INT"
    case wisdom = "WIS"
    case charisma = "CHA"
    
    func modifier(value: Int) -> Int {
        return value / 2 - 5
    }
}
