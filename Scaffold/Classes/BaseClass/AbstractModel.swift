//
//  AbstractModel.swift
//  MainSearch
//
//  Created by 孙琦 on 2020/4/22.
//  Copyright © 2020 sunqi. All rights reserved.
//

import UIKit

open
class AbstractModel: ModelProtocol {
    
    required public init() {}
    
    public var isLast: Bool? = false
    
    public var isFirst: Bool? = false
    
    public func identifier() -> String {
        let modelClassName = NSStringFromClass(type(of: self))
        return (modelClassName as NSString).replacingOccurrences(of: "Model", with: "Cell")
    }

    open func height() -> CGFloat {
        UITableView.automaticDimension
    }

    public func size() -> CGSize {
        CGSize(width: 30, height: 30)
    }
}
