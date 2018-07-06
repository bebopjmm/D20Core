//
//  Actor.swift
//  D20Core
//
//  Created by John McCormick on 7/5/18.
//  Copyright © 2018 John McCormick. All rights reserved.
//

import Foundation

open class Actor {
    // Unique ID for this actor
    var id : UUID
    
    // Full name for this actor
    var fullName : String
    
    // Short name for display
    var shortName : String?
    
    var abilities : [Ability: Int] =
        [Ability.strength : 10,
         Ability.dexterity : 10,
         Ability.constitution : 10,
         Ability.intelligence : 10,
         Ability.wisdom : 10,
         Ability.constitution : 10]
    
    init (actorFullName : String) {
        id = UUID.init()
        fullName = actorFullName
    }
    
    
}
