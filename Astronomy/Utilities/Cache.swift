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
    
    let queue = DispatchQueue(label: "CacheQueue")
    
    func cache(value: Value, for key: Key) {
        queue.async {
            self.store[key] = value
        }
    }
    
    func value(for key: Key) -> Value? {
        var cacheValue: Value?
        queue.sync {
            cacheValue = store[key]
        }
        return cacheValue
    }
}
