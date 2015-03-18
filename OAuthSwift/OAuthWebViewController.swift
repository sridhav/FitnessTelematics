//
//  WebView.swift
//  OAuthSwift
//
//  Created by Sridhar Vemula on 2/25/15.
//  Copyright (c) 2015 Sridhar Vemula. All rights reserved.
//

import Foundation

import UIKit

protocol WebViewProtocol {
    func setUrl(url: NSURL)
}

public class OAuthWebViewController: UIViewController, WebViewProtocol {
    public func setUrl(url: NSURL){}
}