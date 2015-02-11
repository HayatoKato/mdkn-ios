//
//  ViewController.swift
//  mdkn-ios
//
//  Created by 加藤羽也人 on 2015/02/09.
//  Copyright (c) 2015年 Hayato Kato. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var logo: UIImageView!
    @IBAction func backToList(segue: UIStoryboardSegue) {}

    var toDetailObjId: Int?
    let articles = JSON.fromURL("http://sawa-admin.kan-wing.com/mdkn-ios-new.php")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logo.image = UIImage(named: "logo")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var number = 0
        for (key, value) in articles {
            number++
        }
        return number
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var articleCell = tableView.dequeueReusableCellWithIdentifier("article") as ArticleTableViewCell
        
        // Set title from json data
        articleCell.articleTitle.text = articles[indexPath.row]["title"].asString
        
        // Set image fron json data
        var articleImageUrl = NSURL(string: articles[indexPath.row]["image"].asString!)
        var articleImageData = NSData(contentsOfURL: articleImageUrl!)
        articleCell.articleImage.image = UIImage(data: articleImageData!)
        
        return articleCell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Set indexPath to Detail Controller
        var toDetailObjIdStr:String! = articles[indexPath.row]["articleId"].asString
        toDetailObjId = toDetailObjIdStr.toInt()
        performSegueWithIdentifier("toDetailViewController", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toDetailViewController") {
            let detailViewController: DetailViewController = segue.destinationViewController as DetailViewController
            detailViewController.objId = toDetailObjId
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

