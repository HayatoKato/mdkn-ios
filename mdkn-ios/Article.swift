//
//  Article.swift
//  mdkn-ios
//
//  Created by Hayato Kato on 2015/03/15.
//  Copyright (c) 2015年 Hayato Kato. All rights reserved.
//

public class Article {
    public var id: String?
    public var title: String?
    public var main_image: String?
    public var user_nickname: String?
    public var user_image: String?
    public var created: String?
    
    public init() {
    }
    
    public init(dict: JSON) {

        id = dict["id"].asString
        title = dict["title"].asString
        main_image = dict["main_image"].asString
        user_nickname = dict["user_nickname"].asString
        user_image = dict["user_image"].asString
        created = dict["created"].asString
    }
}