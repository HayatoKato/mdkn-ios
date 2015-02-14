//
//  UIColor+mdkn.swift
//  mdkn-ios
//
//  Created by Hayato Kato on 2015/02/14.
//  Copyright (c) 2015年 Hayato Kato. All rights reserved.
//
import UIKit

extension UIColor {
    
    class func mdknPinkColor() -> UIColor {
        return UIColor(red:223/255.0, green:124/255.0, blue:170/255.0, alpha: 1.0)
    }
    
    class func headerColor() -> UIColor {
        return UIColor(red:253/255.0, green:253/255.0, blue:253/255.0, alpha: 1.0)
    }
    
    class func headerTitleColor() -> UIColor {
        return UIColor(red:187/255.0, green:187/255.0, blue:187/255.0, alpha: 1.0)
    }
    
    class func headerLineColor() -> UIColor {
        return UIColor.mdknPinkColor()
    }
    
    class func headerHighLightColor() -> UIColor {
        return UIColor.mdknPinkColor()
    }
    
    class func textAreaBackColor() -> UIColor {
        return UIColor.mdknPinkColor()
    }
    
    class func cellBackColor() -> UIColor {
        return UIColor(red:254/255.0, green:254/255.0, blue:254/255.0, alpha: 1.0)
    }
}