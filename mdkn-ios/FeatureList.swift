//
//  FeatureList.swift
//  mdkn-ios
//
//  Created by Hayato Kato on 2015/03/15.
//  Copyright (c) 2015年 Hayato Kato. All rights reserved.
//

public class FeatureList {
    public var features = [Feature]()
    
    public init() {
    }
    
    public func fetchFeatures(url: String) {
    
        let featureData = JSON.fromURL(url)
        
        for i in 0 ..< featureData.length {
            let n = Feature(dict: featureData[i])
            features.append(n)
        }
    }
}
