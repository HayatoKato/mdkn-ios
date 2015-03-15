//
//  UIColor+mdkn.swift
//  mdkn-ios
//
//  Created by Hayato Kato on 2015/02/14.
//  Copyright (c) 2015年 Hayato Kato. All rights reserved.
//
import UIKit

extension NSString {

    class func apiURL() -> String {
        let basicID: String = "hayato"
        let basicPass: String = "test"
        
        var apiUrl = "http://" + basicID + ":" + basicPass + "@kan-wing.com/api/"
        return apiUrl
    }

    class func apiArticles() -> NSString {
        return apiURL() + "articles"
    }
}
