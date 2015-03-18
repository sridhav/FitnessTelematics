//
//  Dictionary+OAuthSwift.swift
//  OAuthSwift
//
//  Created by Sridhar Vemula on 2/25/15.
//  Copyright (c) 2015 Sridhar Vemula. All rights reserved.
//

import Foundation

extension Dictionary {

    func join(other: Dictionary) -> Dictionary {
        var joinedDictionary = Dictionary()

        for (key, value) in self {
            joinedDictionary.updateValue(value, forKey: key)
        }

        for (key, value) in other {
            joinedDictionary.updateValue(value, forKey: key)
        }

        return joinedDictionary
    }

    func filter(predicate: (key: Key, value: Value) -> Bool) -> Dictionary {
        var filteredDictionary = Dictionary()

        for (key, value) in self {
            if predicate(key: key, value: value) {
                filteredDictionary.updateValue(value, forKey: key)
            }
        }

        return filteredDictionary
    }

    func urlEncodedQueryStringWithEncoding(encoding: NSStringEncoding) -> String {
        var parts = [String]()

        for (key, value) in self {
            let keyString = "\(key)".urlEncodedStringWithEncoding(encoding)
            let valueString = "\(value)".urlEncodedStringWithEncoding(encoding)
            let query = "\(keyString)=\(valueString)" as String
            parts.append(query)
        }

        return "&".join(parts) as String
    }
    
}
