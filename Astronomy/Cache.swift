//
//  Cache.swift
//  Astronomy
//
//  Created by Nathanael Youngren on 2/28/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class Cache<Key: Hashable, Value> {
    
    private var store: [Key: Value] = [:]
    
    func cache(value: Value, for key: Key) {
        store[key] = value
    }
    
    func value(for key: Key) -> Value? {
        guard let value = store[key] else { return nil }
        return value
    }
}
