//
//  Feature.swift
//  mdkn-ios
//
//  Created by Hayato Kato on 2015/03/15.
//  Copyright (c) 2015年 Hayato Kato. All rights reserved.
//

public class Feature {
    public var id: String?
    public var title: String?
    public var main_image: String?
    
    public init() {
    }
    
    public init(dict: JSON) {
        
        id = dict["id"].asString
        title = dict["title"].asString
        main_image = dict["main_image"].asString
    }
}