//
//  ArticleService.swift
//  mdkn-ios
//
//  Created by Hayato Kato on 2015/03/15.
//  Copyright (c) 2015年 Hayato Kato. All rights reserved.
//

public class ArticleService {
    public var articles = [Article]()
    
    public init() {
    }
    
    public func fetchArticles(url: String) {
    
        let articleData = JSON.fromURL(url)
        
        for i in 0 ..< articleData.length {
            let n = Article(dict: articleData[i])
            articles.append(n)
        }
    }
}
