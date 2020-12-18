//
//  ViewProtocol.swift
//  MainSearch
//
//  Created by 孙琦 on 2020/2/19.
//  Copyright © 2020 Tigerobo. All rights reserved.
//

import Foundation

protocol ViewProtocol {
     
    func initSubviews()
    
    func custom(with data: ModelProtocol)
    
    // 兼容OC
//    func custom(with data: TYModelProtocol)
    
    func custom(with text: String)
    
}
