//
//  ViewController.swift
//  mdkn-ios
//
//  Created by Hayato Kato on 2015/02/09.
//  Copyright (c) 2015年 Hayato Kato. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var parentNavigationController : UINavigationController?

    var aritcleService = ArticleService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        aritcleService.fetchArticles(NSString.apiArticles())
        
        var articleTable: UITableView = UITableView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height))
        articleTable.dataSource = self
        articleTable.delegate = self
        
        articleTable.registerClass(Article1x1TableViewCell.classForCoder(), forCellReuseIdentifier: "Article1x1TableViewCell")
        articleTable.registerClass(ArticleBigTableViewCell.classForCoder(), forCellReuseIdentifier: "ArticleBigTableViewCell")
        self.view.addSubview(articleTable)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aritcleService.articles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var articleCell: ArticleTableViewCell
        if indexPath.row == 0 {
            articleCell = tableView.dequeueReusableCellWithIdentifier("ArticleBigTableViewCell") as ArticleBigTableViewCell
        } else {
            articleCell = tableView.dequeueReusableCellWithIdentifier("Article1x1TableViewCell") as Article1x1TableViewCell
        }
        
        var article: Article = aritcleService.articles[indexPath.row]
        articleCell.titleLabel?.text = article.title
        articleCell.userLabel?.text = article.user_nickname
        articleCell.loadMainImage(article.main_image)
        articleCell.loadUserImage(article.user_image)
        
        articleCell.selectionStyle = UITableViewCellSelectionStyle.None
        return articleCell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 260
        }
        
        return 100
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var article: Article = aritcleService.articles[indexPath.row]
        var detailViewController = DetailViewController()
        detailViewController.pageUrl = NSString.webArtcileDetail(article.id!)
        detailViewController.pageTitle = article.title
        
        parentNavigationController!.pushViewController(detailViewController, animated: true)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
