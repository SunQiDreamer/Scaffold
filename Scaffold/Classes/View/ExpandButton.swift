//
//  ExpandButton.swift
//  MainSearch
//
//  Created by 孙琦 on 2020/8/12.
//  Copyright © 2020 sunqi. All rights reserved.
//

import Foundation

class ExpandButton: UIButton {
    var clickExtendX: CGFloat = 20
    var clickExtendY: CGFloat = 20
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let rect = bounds.insetBy(dx: -clickExtendX, dy: -clickExtendY)
        return rect.contains(point)
    }
}
