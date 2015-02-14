//
//  ArticleBigTableViewCell.swift
//  mdkn-ios
//
//  Created by Hayato Kato on 2015/02/15.
//  Copyright (c) 2015年 Hayato Kato. All rights reserved.
//

import UIKit

class ArticleBigTableViewCell: ArticleTableViewCell {
    
    var textAreaView: UIView?
    
    let cellHeight: CGFloat = 260
    let marginLabelTop: CGFloat = 5
    let titleLabeLMarginLeft: CGFloat = 10
    let marginTextAreaTop: CGFloat = 200
    let titleLabelHeight: CGFloat = 30
    let userImageTop: CGFloat = 235
    let userImageLength: CGFloat = 15
    let userLabelTop: CGFloat = 229
    let userLabelMarginLeft: CGFloat = 6
    let userLabelHeight: CGFloat = 25

    override func initCell() {
        initMainImageView()
        initTextAreaView()
        initTitleLabel()
        initUserImage()
        initUserLabel()
    }
    
    override func initMainImageView() {
        mainImage = UIImageView(frame: CGRectMake(0, 0, cellWidth!, cellHeight))
        mainImage?.contentMode = .ScaleAspectFill
        mainImage?.clipsToBounds = true
        self.addSubview(mainImage!)
    }
    
    func initTextAreaView() {
        textAreaView = UIView(frame: CGRectMake(0, marginTextAreaTop, cellWidth!, cellHeight - marginTextAreaTop))
        textAreaView?.backgroundColor = UIColor.textAreaBackColor()
        self.addSubview(textAreaView!)
    }

    override func initTitleLabel() {
        var labelTop = marginTextAreaTop + marginLabelTop
        var labelWidth = cellWidth! - (titleLabeLMarginLeft * 2)
        var labelHeight = cellHeight - labelTop
        titleLabel = UILabel(frame: CGRectMake(titleLabeLMarginLeft, labelTop, labelWidth, titleLabelHeight))
        titleLabel?.font = UIFont(name: "HiraKakuProN-W6", size: 14)
        titleLabel?.textColor = UIColor.whiteColor()
        titleLabel?.numberOfLines = 2
        titleLabel?.lineBreakMode = .ByWordWrapping
        self.addSubview(titleLabel!)
    }
    
    override func initUserImage() {
        userImage = UIImageView(frame: CGRectMake(titleLabeLMarginLeft, userImageTop, userImageLength, userImageLength))
        userImage?.contentMode = .ScaleAspectFill
        userImage?.layer.masksToBounds = false
        userImage?.layer.cornerRadius = userImageLength / 2
        userImage?.clipsToBounds = true
        self.addSubview(userImage!)
    }
    
    override func initUserLabel() {
        var userLabelLeft = titleLabeLMarginLeft + userImageLength + userLabelMarginLeft
        var userLabelWidth = cellWidth! - userLabelLeft
        userLabel = UILabel(frame: CGRectMake(userLabelLeft, userLabelTop, userLabelWidth, userLabelHeight))
        userLabel?.font = UIFont(name: "HiraKakuProN-W3", size: 12)
        userLabel?.textColor = UIColor.whiteColor()
        userLabel?.numberOfLines = 1
        self.addSubview(userLabel!)
    }
}
