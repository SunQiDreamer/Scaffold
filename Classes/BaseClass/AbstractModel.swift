//
//  AbstractModel.swift
//  MainSearch
//
//  Created by 孙琦 on 2020/4/22.
//  Copyright © 2020 Tigerobo. All rights reserved.
//

import UIKit

class AbstractModel: ModelProtocol {
    
    required init() {}
    
    var isLast: Bool? = false
    
    var isFirst: Bool? = false
    
    func identifier() -> String {
        let modelClassName = NSStringFromClass(type(of: self))
        return (modelClassName as NSString).replacingOccurrences(of: "Model", with: "Cell")
    }

    func height() -> CGFloat {
        UITableView.automaticDimension
    }

    func size() -> CGSize {
        CGSize(width: 30, height: 30)
    }
}
