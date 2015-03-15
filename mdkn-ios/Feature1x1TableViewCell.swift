//
//  Feature1x1TableViewCell.swift
//  mdkn-ios
//
//  Created by Hayato Kato on 2015/02/15.
//  Copyright (c) 2015年 Hayato Kato. All rights reserved.
//

import UIKit
import QuartzCore

class Feature1x1TableViewCell: FeatureTableViewCell {
    
    let cellHeight: CGFloat = 100
    let marginTop: CGFloat = 12
    let marginLeft: CGFloat = 8
    let marginLabelLeft: CGFloat = 10
    let titleLabelTop: CGFloat = -12
    let titleLabelHeight: CGFloat = 40
    
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
}
