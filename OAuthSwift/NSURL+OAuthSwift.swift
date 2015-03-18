//
//  NSURL+OAuthSwift.swift
//  OAuthSwift
//
//  Created by Sridhar Vemula on 2/25/15.
//  Copyright (c) 2015 Sridhar Vemula. All rights reserved.
//

import Foundation


extension NSURL {

    func URLByAppendingQueryString(queryString: String) -> NSURL {
        if queryString.utf16Count == 0 {
            return self
        }

        var absoluteURLString = self.absoluteString!

        if absoluteURLString.hasSuffix("?") {
            absoluteURLString = (absoluteURLString as NSString).substringToIndex(absoluteURLString.utf16Count - 1)
        }

        let URLString = absoluteURLString + (absoluteURLString.rangeOfString("?") != nil ? "&" : "?") + queryString

        return NSURL(string: URLString)!
    }

}
