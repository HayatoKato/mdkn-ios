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

    var indexPathRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logo.image = UIImage(named: "logo")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var articleCell = tableView.dequeueReusableCellWithIdentifier("article") as ArticleTableViewCell
        articleCell.articleTitle.text = "人気のロリポップ作りました！　～キットの型を利用してアレンジ☆"
        articleCell.articleImage.image = UIImage(named: "article-image")
        return articleCell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        indexPathRow = indexPath.row
        performSegueWithIdentifier("toDetailViewController", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toDetailViewController") {
            let detailViewController: DetailViewController = segue.destinationViewController as DetailViewController
            detailViewController.objId = indexPathRow
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

