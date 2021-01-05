//
//  ExpressibleByIntegerLiteral+font.swift
//  MainSearch
//
//  Created by 孙琦 on 2020/6/18.
//  Copyright © 2020 sunqi. All rights reserved.
//

import Foundation

extension ExpressibleByIntegerLiteral where Self : BinaryInteger {
    var normalFont: UIFont {
        .pingFangRegularFont(ofSize: self.scale)
    }
    
    var mediumFont: UIFont {
        .pingFangMediumFont(ofSize: self.scale)
    }
    
    var semiboldFont: UIFont {
        .pingFangSemiboldFont(ofSize: self.scale)
    }
    
    var boldFont: UIFont {
        .pingFangBoldFont(ofSize: self.scale)
    }
    
    var regularDINFont: UIFont {
        .regularDINProFont(ofSize: self.scale)
    }
    
    var mediumDINFont: UIFont {
        .mediumDINProFont(ofSize: self.scale)
    }
    
    var boldDINFont: UIFont {
        .boldDINProFont(ofSize: self.scale)
    }
    
    var italicDINProFont: UIFont {
        .italicDINProFont(ofSize: self.scale)
    }
    
    var iconFont: UIFont {
        .iconFont(ofSize: self.scale)
    }
    
}
