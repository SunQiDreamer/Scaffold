//
//  Compatible.swift
//  MainSearch
//
//  Created by 孙琦 on 2020/5/24.
//  Copyright © 2020 Tigerobo. All rights reserved.
//

import Foundation

protocol TYCompatible {
    
}

extension TYCompatible {
    var ty: TY<Self> {
        set {}
        get {
          TY(self)
        }
    }
    
    static var ty: TY<Self>.Type {
        set {}
        get {
           TY<Self>.self
        }
    }
}
