//
//  Adjustment.swift
//  D20Core
//
//  Created by John McCormick on 9/30/18.
//  Copyright © 2018 John McCormick. All rights reserved.
//

import Foundation

protocol Disposable {
    func dispose()
}

protocol ModifierListener {
    func modifierChanged(modifier: Modifier, valueDelta: Int)
    func apply(modifier: Modifier)
}

enum ModifierCategory {
    case inherent, equipment, effect
}

class Modifier : Hashable {
    
    var value: Int = 0 {
        willSet(newValue) {
            
        }
        didSet {
            if value != oldValue {
                let delta = value - oldValue
                notifyOfChange(delta: delta)
            }
        }
    }
    let category : ModifierCategory
    let name : String
    fileprivate var subscribers = [ModifierChangeHandler]()
    
    init(name : String, modifierValue : Int, category : ModifierCategory) {
        self.name = name
        value = modifierValue
        self.category = category
    }
    
    private func notifyOfChange(delta: Int) {
        print("Notify of change on \(self.name) with delta = \(delta) to subscribers [\(subscribers.count)]")
        for handler in subscribers {
            handler.handle(modifier: self, valueDelta: delta)
        }
    }
    
    func subscribe(listener: ModifierListener) -> Disposable {
        let handler = ModifierChangeHandler(modifier: self, handler: listener)
        subscribers.append(handler)
        listener.apply(modifier: self)
        return handler
    }
    
    static func == (lhs: Modifier, rhs: Modifier) -> Bool {
        return lhs.name == rhs.name && lhs.category == rhs.category
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(category)
    }
}

private class ModifierChangeHandler : Disposable {
    let modifier: Modifier
    let handler: ModifierListener
    
    init(modifier: Modifier, handler: ModifierListener) {
        self.modifier = modifier
        self.handler = handler
    }
    
    func dispose() {
        modifier.subscribers = modifier.subscribers.filter { $0 !== self }
    }
    
    func handle(modifier: Modifier, valueDelta: Int) {
        handler.modifierChanged(modifier: modifier, valueDelta: valueDelta)
    }
}


