//
//  ArticleBigTableViewCell.swift
//  mdkn-ios
//
//  Created by Hayato Kato on 2015/02/15.
//  Copyright (c) 2015年 Hayato Kato. All rights reserved.
//

import UIKit

class ArticleBigTableViewCell: ArticleTableViewCell {
    
    let cellHeight: CGFloat = 250
    let mainImageHeight: CGFloat = 100
    let marginLabelTop: CGFloat = 10
    let marginLabelLeft: CGFloat = 10

    override func initMainImageView() {
        mainImage = UIImageView(frame: CGRectMake(0, 0, cellWidth!, mainImageHeight))
        mainImage?.contentMode = .ScaleAspectFill
        self.addSubview(mainImage!)
    }

    override func initTitleLabel() {
        var labelTop = mainImageHeight + marginLabelTop
        var labelWidth = cellWidth! - (marginLabelLeft * 2)
        var labelHeight = cellHeight - mainImageHeight - marginLabelTop
        titleLabel = UILabel(frame: CGRectMake(marginLabelLeft, labelTop, labelWidth, labelHeight))
        titleLabel?.font = UIFont(name: "HiraKakuProN-W3", size: 14)
        titleLabel?.numberOfLines = 2
        titleLabel?.lineBreakMode = .ByWordWrapping
        self.addSubview(titleLabel!)
    }    
}
