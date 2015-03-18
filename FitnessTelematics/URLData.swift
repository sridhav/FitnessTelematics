//
//  URLData.swift
//  SampleApp
//
//  Created by Sridhar Vemula on 2/27/15.
//  Copyright (c) 2015 Sridhar Vemula. All rights reserved.
//

import Foundation

class URLData {
    
    let url:NSURL!
    var json:JSON = nil
    
    init(urlString: String){
        self.url = NSURL(string: urlString)
        getJsonFromUrl()
    }
    
    private func getJsonFromUrl() -> Void{
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
                println(NSString(data: data!, encoding: NSUTF8StringEncoding))
                self.json = JSON(data: data!)
        }
        task.resume()
    }
    
    func getJSON() -> JSON!{
        while self.json == nil {
        }
        return self.json
    }
}