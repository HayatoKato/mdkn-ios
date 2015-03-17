//
//  NSString+mdkn.swift
//  mdkn-ios
//
//  Created by Hayato Kato on 2015/02/14.
//  Copyright (c) 2015年 Hayato Kato. All rights reserved.
//
import UIKit

extension NSString {
    
    class func apiURL() -> String {
        let basicID: String = "netallica"
        let basicPass: String = "zTRJ7.wsT46yQ"
        
        var apiUrl = "http://" + basicID + ":" + basicPass + "@test.kurashinista.jp/api/"
        return apiUrl
    }
    
    class func apiArticles() -> String {
        return apiURL() + "article"
    }
    
    class func apiFeatures() -> String {
        return apiURL() + "feature"
    }
    
    class func webURL() -> String {
        var webUrl = "http://kurashinista.jp/"
        return webUrl
    }
    
    class func webArtcileDetail(id: String) -> String {
        return webURL() + "articles/detail/" + id
    }
    
    class func webFeatureDetail(id: String) -> String {
        return webURL() + "feature/detail/" + id
    }
}
