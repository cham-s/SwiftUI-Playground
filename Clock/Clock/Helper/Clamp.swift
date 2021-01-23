//
//  Clamp.swift
//  Clock
//
//  Created by chams on 23/01/2021.
//

import Foundation

struct Clamping {
    private var maximum: Int
    private var number: Int
    
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }
    
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}
