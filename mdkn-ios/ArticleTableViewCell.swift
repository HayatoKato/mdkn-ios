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
    var userLabel: UILabel?
    var userImage: UIImageView?
    var cellWidth: CGFloat?

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellWidth = UIScreen.mainScreen().bounds.size.width
        initCell()
    }

    func initCell() {
        self.backgroundColor = UIColor.cellBackColor()
        initMainImageView()
        initTitleLabel()
        initUserImage()
        initUserLabel()
    }
    
    func initMainImageView() {
    }
    
    func initTitleLabel() {
    }
    
    func initUserImage() {
    }
    
    func initUserLabel() {
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
