//
//  DetailViewController.swift
//  mdkn-ios
//
//  Created by Hayato Kato on 2015/02/12.
//  Copyright (c) 2015年 Hayato Kato. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var webView: UIWebView!
    var screenHeight: CGFloat?
    var screenWidth: CGFloat?
    var objId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenHeight = self.view.bounds.height
        screenWidth = self.view.bounds.width
        initWebView()
    }
    
    func initWebView() {
        webView = UIWebView(frame: CGRectMake(0, 0, screenWidth!, screenHeight!))
        if let objIdNotOptional = objId {
            var articleDetailUrl = NSURL(string: "http://kurashinista.jp/sp/articles/detail/" + objIdNotOptional.description)
            var articleDetailUrlReq = NSURLRequest(URL: articleDetailUrl!)
            webView.loadRequest(articleDetailUrlReq)
        }
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
