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

protocol AdjustmentListener {
    func adjustmentChanged(adjustment: Adjustment, modifierDelta: Int)
    func apply(adjustment: Adjustment)
}

enum AdjustmentCategory {
    case inherent, equipment, effect
}

class Adjustment : Hashable {
    
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
    let category : AdjustmentCategory
    let name : String
    fileprivate var subscribers = [AdjustmentEventHandler]()
    
    init(name : String, modifierValue : Int, category : AdjustmentCategory) {
        self.name = name
        value = modifierValue
        self.category = category
    }
    
    private func notifyOfChange(delta: Int) {
        print("Notify of change on \(self.name) with delta = \(delta) to subscribers [\(subscribers.count)]")
        for handler in subscribers {
            handler.handle(adjustment: self, modifierDelta: delta)
        }
    }
    
    func subscribe(listener: AdjustmentListener) -> Disposable {
        let handler = AdjustmentEventHandler(adjustment: self, handler: listener)
        subscribers.append(handler)
        listener.apply(adjustment: self)
        return handler
    }
    
    static func == (lhs: Adjustment, rhs: Adjustment) -> Bool {
        return lhs.name == rhs.name && lhs.category == rhs.category
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(category)
    }
}

private class AdjustmentEventHandler : Disposable {
    let adjustment: Adjustment
    let handler: AdjustmentListener
    
    init(adjustment: Adjustment, handler: AdjustmentListener) {
        self.adjustment = adjustment
        self.handler = handler
    }
    
    func dispose() {
        adjustment.subscribers = adjustment.subscribers.filter { $0 !== self }
    }
    
    func handle(adjustment: Adjustment, modifierDelta: Int) {
        handler.adjustmentChanged(adjustment: adjustment, modifierDelta: modifierDelta)
    }
}


