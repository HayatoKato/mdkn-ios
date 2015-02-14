//
//  ArticleViewCell.swift
//  mdkn-ios
//
//  Created by Hayato Kato on 2015/02/14.
//  Copyright (c) 2015年 Hayato Kato. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    var titleLabel: UILabel?
    var mainImage: UIImageView?
    var cellWidth: CGFloat?

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initCell()
    }

    func initCell() {
        cellWidth = UIScreen.mainScreen().bounds.size.width
        
        initTitleLabel()
        initMainImageView()
    }
    
    func initMainImageView() {
    }
    
    func initTitleLabel() {
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
