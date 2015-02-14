//
//  Article1x1TableViewCell.swift
//  mdkn-ios
//
//  Created by Hayato Kato on 2015/02/15.
//  Copyright (c) 2015年 Hayato Kato. All rights reserved.
//

import UIKit
import QuartzCore

class Article1x1TableViewCell: ArticleTableViewCell {

    let cellHeight: CGFloat = 100
    let marginTop: CGFloat = 8
    let marginLeft: CGFloat = 8
    let marginLabelLeft: CGFloat = 10
    let titleLabelTop: CGFloat = -12
    let titleLabelHeight: CGFloat = 40
    let userImageTop: CGFloat = 58
    let userImageLength: CGFloat = 15
    let userLabelTop: CGFloat = 50
    let userLabelMarginLeft: CGFloat = 6
    let userLabelHeight: CGFloat = 30
    
    func getImageLength() ->CGFloat {
        return cellHeight - (marginTop * 2)
    }
    
    func getRightAreaLeft() ->CGFloat {
        return marginLeft + getImageLength() + marginLabelLeft
    }

    override func initMainImageView() {
        mainImage = UIImageView(frame: CGRectMake(marginLeft, marginTop, getImageLength(), getImageLength()))
        mainImage?.contentMode = .ScaleAspectFill
        self.addSubview(mainImage!)
    }
    
    override func initTitleLabel() {
        var titleLabelWidth = cellWidth! - getImageLength() - (marginLeft * 2)
        var titleLabelHeight = cellHeight - marginTop
        titleLabel = UILabel(frame: CGRectMake(getRightAreaLeft(), titleLabelTop, titleLabelWidth, titleLabelHeight))
        titleLabel?.font = UIFont(name: "HiraKakuProN-W3", size: 14)
        titleLabel?.numberOfLines = 2
        self.addSubview(titleLabel!)
    }
    
    override func initUserImage() {
        userImage = UIImageView(frame: CGRectMake(getRightAreaLeft(), userImageTop, userImageLength, userImageLength))
        userImage?.contentMode = .ScaleAspectFill
        userImage?.layer.masksToBounds = false
        userImage?.layer.cornerRadius = userImageLength / 2
        userImage?.clipsToBounds = true
        self.addSubview(userImage!)
    }
    
    override func initUserLabel() {
        var userLabelLeft = getRightAreaLeft() + userImageLength + userLabelMarginLeft
        var userLabelWidth = cellWidth! - getImageLength() - (marginLeft * 2)
        userLabel = UILabel(frame: CGRectMake(userLabelLeft, userLabelTop, userLabelWidth, userLabelHeight))
        userLabel?.font = UIFont(name: "HiraKakuProN-W3", size: 12)
        userLabel?.textColor = UIColor.grayColor()
        userLabel?.numberOfLines = 1
        self.addSubview(userLabel!)
    }
}
