//
//  ViewController.swift
//  PageMenuDemoSegmentedControl
//
//  Created by Niklas Fahl on 1/20/15.
//  Copyright (c) 2015 Niklas Fahl. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CAPSPageMenuDelegate {
    var pageMenu : CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var titleImageView: UIImageView? = UIImageView( image: UIImage(named: "logo"))
        self.navigationItem.titleView = titleImageView
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.barTintColor = UIColor.headerColor()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = false
        
        // MARK: - Scroll menu setup
        
        // Initialize view controllers to display and place in array
        var controllerArray : [UIViewController] = []
        
        var controller1 : ArticleViewController = ArticleViewController()
        controller1.parentNavigationController = self.navigationController
        controller1.title = "TOP"
        controllerArray.append(controller1)
        
        var controller2 : FeatureViewController = FeatureViewController()
        controller2.parentNavigationController = self.navigationController
        controller2.title = "特集"
        controllerArray.append(controller2)
        
        var controller3 : ArticleViewController = ArticleViewController()
        controller3.title = "ニュース"
        controller3.parentNavigationController = self.navigationController
        controllerArray.append(controller3)
        
        var controller4 : ArticleViewController = ArticleViewController()
        controller4.title = "ランキング"
        controller4.parentNavigationController = self.navigationController
        controllerArray.append(controller4)
        
        var controller5 : ArticleViewController = ArticleViewController()
        controller5.title = "家事"
        controller5.parentNavigationController = self.navigationController
        controllerArray.append(controller5)
        
        // Customize menu (Optional)
        var parameters: [String: AnyObject] = ["scrollMenuBackgroundColor": UIColor.headerColor(),
            "viewBackgroundColor": UIColor.headerColor(),
            "selectionIndicatorColor": UIColor.headerHighLightColor(),
            "bottomMenuHairlineColor": UIColor.headerTitleColor(),
            "selectedMenuItemLabelColor": UIColor.headerHighLightColor(),
            "selectionIndicatorHeight": 2.0,
            "menuItemFont": UIFont(name: "HiraKakuProN-W3", size: 13.0)!,
            "menuHeight": 30.0,
            "menuItemWidth": 80.0,
            "menuMargin": 0.0,
            "menuItemSeparatorRoundEdges": true,
            "centerMenuItems": true]
        
        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), options: parameters)
        
        // Optional delegate
        pageMenu!.delegate = self
        
        self.view.addSubview(pageMenu!.view)
    }
}
