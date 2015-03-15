//
//  FeatureViewController.swift
//  mdkn-ios
//
//  Created by Hayato Kato on 2015/02/09.
//  Copyright (c) 2015年 Hayato Kato. All rights reserved.
//

import UIKit

class FeatureViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var parentNavigationController : UINavigationController?
    
    var list = FeatureList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list.fetchFeatures(NSString.apiFeatures())
        
        var featureTable: UITableView = UITableView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height))
        featureTable.dataSource = self
        featureTable.delegate = self
        
        featureTable.registerClass(Feature1x1TableViewCell.classForCoder(), forCellReuseIdentifier: "Feature1x1TableViewCell")
        featureTable.registerClass(FeatureBigTableViewCell.classForCoder(), forCellReuseIdentifier: "FeatureBigTableViewCell")
        self.view.addSubview(featureTable)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.features.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var featureCell: FeatureTableViewCell
        if indexPath.row == 0 {
            featureCell = tableView.dequeueReusableCellWithIdentifier("FeatureBigTableViewCell") as FeatureBigTableViewCell
        } else {
            featureCell = tableView.dequeueReusableCellWithIdentifier("Feature1x1TableViewCell") as Feature1x1TableViewCell
        }
        
        var feature: Feature = list.features[indexPath.row]
        featureCell.titleLabel?.text = feature.title
        featureCell.loadMainImage(feature.main_image)
        
        featureCell.selectionStyle = UITableViewCellSelectionStyle.None
        return featureCell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 260
        }
        
        return 100
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var feature: Feature = list.features[indexPath.row]
        var detailViewController = DetailViewController()
        detailViewController.pageUrl = NSString.webFeatureDetail(feature.id!)
        detailViewController.pageTitle = feature.title
        
        parentNavigationController!.pushViewController(detailViewController, animated: true)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

