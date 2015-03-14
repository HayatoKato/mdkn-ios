//
//  DetailViewController.swift
//  mdkn-ios
//
//  Created by Hayato Kato on 2015/02/12.
//  Copyright (c) 2015年 Hayato Kato. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    var wkWebview: WKWebView?
    var progressBar: UIProgressView?
    var screenHeight: CGFloat?
    var screenWidth: CGFloat?
    var objId: Int?
    var pageTitle: NSString?
    
    let footerHeight:CGFloat = 50.0
    let progressBarHeight: CGFloat = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenHeight = self.view.bounds.height
        screenWidth = self.view.bounds.width
        initBackButton()
        initProgressBar()
        initWebView()
    }
    
    func initProgressBar() {
        progressBar = UIProgressView(frame: CGRectMake(0, 0, screenWidth!, progressBarHeight))
        progressBar!.progressTintColor = UIColor.mdknPinkColor()
        progressBar!.trackTintColor = UIColor.whiteColor()
        progressBar!.setProgress(1.0, animated: true)
        progressBar!.transform = CGAffineTransformMakeScale(1.0, 2.0)
        self.view.addSubview(progressBar!)
    }
    
    func initWebView() {
        wkWebview = WKWebView(frame: CGRectMake(0, progressBarHeight, screenWidth!, screenHeight!))
        if let objIdNotOptional = objId {
            var articleDetailUrl = NSURL(string: "http://kurashinista.jp/sp/articles/detail/" + objIdNotOptional.description)
            var articleDetailUrlReq = NSURLRequest(URL: articleDetailUrl!)
            wkWebview!.loadRequest(articleDetailUrlReq)
        }
        self.view.addSubview(wkWebview!)
        wkWebview?.addObserver(self, forKeyPath:"estimatedProgress", options:.New, context:nil)
    }
    
    func initBackButton() {
        let backButton = UIBarButtonItem(title: "＞　" + pageTitle!, style: UIBarButtonItemStyle.Plain, target: self, action: "back")
        backButton.width = screenWidth! - 100
        backButton.tintColor = UIColor.mdknPinkColor()
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "HiraKakuProN-W6", size: 12)!], forState: UIControlState.Normal)
    }
    
    func back() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func observeValueForKeyPath(keyPath:String, ofObject object:AnyObject, change:[NSObject:AnyObject], context:UnsafeMutablePointer<Void>) {
        switch keyPath {
        case "estimatedProgress":
            if let progress = change[NSKeyValueChangeNewKey] as? Float {
                println("Progress:\(progress)")
                progressBar?.progress
            }
        default:
            break
        }
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        wkWebview?.removeObserver(self, forKeyPath: "estimatedProgress")
    }
}
