//
//  AdjustableValue.swift
//  D20Core
//
//  Created by John McCormick on 7/5/18.
//  Copyright © 2018 John McCormick. All rights reserved.
//

import Foundation

protocol ModifiableValueListener {
    func valueChanged(modifiableValue: ModifiableValue, valueDelta: Int)
}

class ModifiableValue {
    private var baseValue : Int
    var currentValue : Int
    var modifiers = Set<Modifier>()
    fileprivate var subscribers = [ModifiableValueChangeHandler]()


    init(baseValue: Int) {
        self.baseValue = baseValue
        currentValue = baseValue
    }

    func recalculateCurrent() {
        currentValue = baseValue
        for modifier in modifiers {
            currentValue += modifier.value
        }
    }
}

private class ModifiableValueChangeHandler : Disposable {
    let modifiableValue: ModifiableValue
    let handler: ModifiableValueListener
    
    init(value: ModifiableValue, handler: ModifiableValueListener) {
        self.modifiableValue = value
        self.handler = handler
    }
    
    func dispose() {
        modifiableValue.subscribers = modifiableValue.subscribers.filter { $0 !== self }
    }
    
    func handle(modifiableValue: ModifiableValue, valueDelta: Int) {
        handler.valueChanged(modifiableValue: modifiable, valueDelta: valueDelta)
    }
}
