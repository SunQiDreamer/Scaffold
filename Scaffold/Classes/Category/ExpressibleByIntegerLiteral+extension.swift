//
//  ExpressibleByIntegerLiteral+extension.swift
//  MainSearch
//
//  Created by 孙琦 on 2020/6/18.
//  Copyright © 2020 sunqi. All rights reserved.
//

import Foundation

extension ExpressibleByIntegerLiteral where Self : BinaryInteger {
    var scale: CGFloat {
        CGFloatScale(CGFloat(self))
    }
}

extension Double: TYCompatible {}

extension TY where T == Double {
    
    func toFixed(_ num: Int) -> String {
        let format = "%.\(num)f"
        return String(format: format, t)
    }
}
