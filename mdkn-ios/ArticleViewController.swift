//
//  ViewController.swift
//  mdkn-ios
//
//  Created by Hayato Kato on 2015/02/09.
//  Copyright (c) 2015年 Hayato Kato. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var toDetailObjId: Int?
    let articles = JSON.fromURL("http://sawa-admin.kan-wing.com/mdkn-ios-new.php")
    let marginTop: CGFloat = 22
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var articleTable: UITableView = UITableView(frame: CGRectMake(0, marginTop, self.view.bounds.width, self.view.bounds.height))
        articleTable.dataSource = self
        articleTable.delegate = self
        
        articleTable.registerClass(Article1x1TableViewCell.classForCoder(), forCellReuseIdentifier: "Article1x1TableViewCell")
        articleTable.registerClass(ArticleBigTableViewCell.classForCoder(), forCellReuseIdentifier: "ArticleBigTableViewCell")
        self.view.addSubview(articleTable)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var number = 0
        for (key, value) in articles {
            number++
        }
        return number
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var articleCell: ArticleTableViewCell
        if indexPath.row == 0 {
            articleCell = tableView.dequeueReusableCellWithIdentifier("ArticleBigTableViewCell") as ArticleBigTableViewCell
        } else {
            articleCell = tableView.dequeueReusableCellWithIdentifier("Article1x1TableViewCell") as Article1x1TableViewCell
        }
        
        articleCell.titleLabel?.text = articles[indexPath.row]["title"].asString
        articleCell.userLabel?.text = articles[indexPath.row]["author_nickname"].asString
        articleCell.loadMainImage(articles[indexPath.row]["image"].asString!)
        articleCell.loadUserImage(articles[indexPath.row]["author_image"].asString!)
        return articleCell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 260
        }
        
        return 100
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        var toDetailObjIdStr:String! = articles[indexPath.row]["articleId"].asString
        toDetailObjId = toDetailObjIdStr.toInt()
        let detailViewController = DetailViewController()
        detailViewController.objId = toDetailObjId
        detailViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        self.presentViewController(detailViewController, animated: true, completion: nil)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

