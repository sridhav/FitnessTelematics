//
//  NSData+OAuthSwift.swift
//  OAuthSwift
//
//  Created by Sridhar Vemula on 2/25/15.
//  Copyright (c) 2015 Sridhar Vemula. All rights reserved.
//

import Foundation

extension NSMutableData {
    internal func appendBytes(arrayOfBytes: [Byte]) {
        self.appendBytes(arrayOfBytes, length: arrayOfBytes.count)
    }
    
}

extension NSData {
    func bytes() -> [Byte] {
        let count = self.length / sizeof(Byte)
        var bytesArray = [Byte](count: count, repeatedValue: 0)
        self.getBytes(&bytesArray, length:count * sizeof(Byte))
        return bytesArray
    }
    
    class public func withBytes(bytes: [Byte]) -> NSData {
        return NSData(bytes: bytes, length: bytes.count)
    }
}

