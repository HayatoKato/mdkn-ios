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
    var footerView: UIView!
    var footerTopView: UIView!
    var footerBackButton: UIButton!
    var screenHeight: CGFloat?
    var screenWidth: CGFloat?
    var objId: Int?
    
    let footerHeight:CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenHeight = self.view.bounds.height
        screenWidth = self.view.bounds.width
        initWebView()
        initFooterView()
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
    
    func initFooterView() {
        footerView = UIView(frame: CGRectMake(0, screenHeight! - footerHeight, screenWidth!, footerHeight))
        footerView?.backgroundColor = UIColor.footerBackgroundColor()

        // Add footer top line
        footerTopView = UIView(frame: CGRectMake(0, 0, screenWidth!, 1))
        footerTopView?.backgroundColor = UIColor.footerTopColor()
        footerView.addSubview(footerTopView)

        // Add back button
        footerBackButton = UIButton(frame: CGRectMake(10, 5, 30, 40))
        footerBackButton.setTitleColor(UIColor.footerBackButtonColor(), forState:.Normal)
        footerBackButton.titleLabel!.font = UIFont(name: "HiraKakuProN-W6", size: 23);
        footerBackButton.addTarget(self, action: "closeWindow:", forControlEvents: UIControlEvents.TouchUpInside)
        footerBackButton.setTitle("＜", forState:UIControlState.Normal)
        footerView.addSubview(footerBackButton)

        self.view.addSubview(footerView)
    }

    func closeWindow(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
