//
//  Dictionary+Union.swift
//  TextKit Example
//
//  Created by Aashish Tamsya on 07/06/17.
//  Copyright © 2017 Aashish Tamsya. All rights reserved.
//

import Foundation

extension Dictionary {
    
    func each (each: (Key, Value) -> ()) {
        for (key, value) in self {
            each(key, value)
        }
    }
    
    func union (dictionaries: Dictionary...) -> Dictionary {
        var result = self
        dictionaries.forEach { (dictionary) -> Void in
            dictionary.each { (key, value) -> Void in
                _ = result.updateValue(value, forKey: key)
            }
        }
        return result
    }
}
