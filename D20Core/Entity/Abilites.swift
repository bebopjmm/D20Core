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

class AbilityValue: ModifiableValue {
    var abilityModifier : Modifier
    let ability : Ability
    
    init(ability: Ability, baseValue: Int) {
        self.ability = ability
        self.abilityModifier = Modifier(name: "ability.\(ability.rawValue)", modifierValue: 0, category: ModifierCategory.inherent)
        super.init(baseValue: baseValue)
        self.abilityModifier.value = ability.modifier(value: self.currentValue)
    }
}
