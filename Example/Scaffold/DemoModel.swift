//
//  DemoModel.swift
//  Scaffold_Example
//
//  Created by 孙琦 on 2021/1/4.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import Scaffold

class DemoModel: AbstractModel {

    var title: String?
    
    override func height() -> CGFloat {
        CGFloatScale(64)
    }
    
}
