//
//  Article1x1TableViewCell.swift
//  mdkn-ios
//
//  Created by Hayato Kato on 2015/02/15.
//  Copyright (c) 2015年 Hayato Kato. All rights reserved.
//

import UIKit

class Article1x1TableViewCell: ArticleTableViewCell {

    let cellHeight: CGFloat = 100
    let marginTop: CGFloat = 8
    let marginLeft: CGFloat = 8
    let marginLabelLeft: CGFloat = 10
    
    func getImageLength() ->CGFloat {
        return cellHeight - (marginTop * 2)
    }

    override func initMainImageView() {
        mainImage = UIImageView(frame: CGRectMake(marginLeft, marginTop, getImageLength(), getImageLength()))
        mainImage?.contentMode = .ScaleAspectFill
        self.addSubview(mainImage!)
    }
    
    override func initTitleLabel() {
        var labelLeft = marginLeft + getImageLength() + marginLabelLeft
        var labelWidth = cellWidth! - getImageLength() - (marginLeft * 2)
        var labelHeight = cellHeight - marginTop
        titleLabel = UILabel(frame: CGRectMake(labelLeft, 0, labelWidth, labelHeight))
        titleLabel?.font = UIFont(name: "HiraKakuProN-W3", size: 14)
        titleLabel?.numberOfLines = 3
        titleLabel?.lineBreakMode = .ByWordWrapping
        self.addSubview(titleLabel!)
    } 
}
