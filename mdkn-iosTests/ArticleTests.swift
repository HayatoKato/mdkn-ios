//
//  ArticleTests.swift
//  mdkn-ios
//
//  Created by 加藤 羽也人 on 2015/03/30.
//  Copyright (c) 2015年 Hayato Kato. All rights reserved.
//

import UIKit
import XCTest
import mdkn_ios

class ArticleTests: XCTestCase {

     var article = Article()
    
    override func setUp() {
        super.setUp()
        
        let obj:[String:AnyObject] = [
            "id": "7917",
            "title": "テスト投稿0324",
            "main_image": "http://p.kurashinista.jp/get/2015/03/24/42598c090646425fbb82ddf1128036d6.jpg",
            "user_image": "http://p.kurashinista.jp/get/?csize=40x40",
            "user_nickname": "inamura",
            "created": "2015-03-24 16:24:55"
        ]
        let json = JSON(obj)
        article = Article(dict: json)
    }
    
    func testSetData() {
        XCTAssertEqual(article.id!, "7917", "should have article id")
        XCTAssertEqual(article.title!, "テスト投稿0324", "should have article title")
        XCTAssertEqual(article.main_image!, "http://p.kurashinista.jp/get/2015/03/24/42598c090646425fbb82ddf1128036d6.jpg", "should have article main_image")
        XCTAssertEqual(article.user_nickname!, "inamura", "should have article id")
        XCTAssertEqual(article.user_image!, "http://p.kurashinista.jp/get/?csize=40x40", "should have article id")
        XCTAssertEqual(article.created!, "2015-03-24 16:24:55", "should have article id")
    }
}
