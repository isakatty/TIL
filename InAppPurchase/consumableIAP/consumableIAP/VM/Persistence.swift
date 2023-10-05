//
//  Persistence.swift
//  consumableIAP
//
//  Created by Jisoo HAM on 10/3/23.
//

import Foundation

class Persistence {
    // 파베에 값이 올라가니까 우리는 이렇게까지 필요 없음.
    static let consumablesCountKey = "consumablesCount"
    static let consumablesCountKey1 = "consumablesCount1"
    
    private static let storage = UserDefaults()
    
    static func increaseConsumablesCount() {
        let currentValue = storage.integer(forKey: Persistence.consumablesCountKey)
        storage.set(currentValue + 1, forKey: Persistence.consumablesCountKey)
    }
    
    static func increaseConsumablesCount1() {
        let currentValue = storage.integer(forKey: Persistence.consumablesCountKey1)
        storage.set(currentValue + 1, forKey: Persistence.consumablesCountKey1)
    }
}
