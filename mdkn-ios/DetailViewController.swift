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
    var pageTitle: NSString?
    
    let footerHeight:CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenHeight = self.view.bounds.height
        screenWidth = self.view.bounds.width
        initBackButton()
        initWebView()
    }
    
    func initWebView() {
        webView = UIWebView(frame: CGRectMake(0, 0, screenWidth!, screenHeight!))
        if let objIdNotOptional = objId {
            var articleDetailUrl = NSURL(string: "http://kurashinista.jp/sp/articles/detail/" + objIdNotOptional.description)
            var articleDetailUrlReq = NSURLRequest(URL: articleDetailUrl!)
            webView.loadRequest(articleDetailUrlReq)
        }
        self.view.addSubview(webView)
    }
    
    func initBackButton() {
        let backButton = UIBarButtonItem(title: "＞　" + pageTitle!, style: UIBarButtonItemStyle.Plain, target: self, action: "back")
        backButton.tintColor = UIColor.mdknPinkColor()
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "HiraKakuProN-W6", size: 12)!], forState: UIControlState.Normal)
    }
    
    func back() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
