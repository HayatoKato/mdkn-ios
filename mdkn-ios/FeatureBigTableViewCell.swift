//
//  FeatureBigTableViewCell.swift
//  mdkn-ios
//
//  Created by Hayato Kato on 2015/02/15.
//  Copyright (c) 2015年 Hayato Kato. All rights reserved.
//

import UIKit

class FeatureBigTableViewCell: FeatureTableViewCell {
    
    var textAreaView: UIView?
    
    let cellHeight: CGFloat = 260
    let marginLabelTop: CGFloat = 5
    let titleLabeLMarginLeft: CGFloat = 10
    let marginTextAreaTop: CGFloat = 200
    let titleLabelHeight: CGFloat = 30
    
    override func initCell() {
        initMainImageView()
        initTextAreaView()
        initTitleLabel()
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
}
