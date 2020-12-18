//
//  ModelProtocol.swift
//  MainSearch
//
//  Created by 孙琦 on 2020/2/19.
//  Copyright © 2020 Tigerobo. All rights reserved.
//

import UIKit

protocol ModelProtocol {
    
    func identifier() -> String
    
    // tableViewCell
    func height() -> CGFloat
    
    // collectionCell
    func size() -> CGSize
    
    var isFirst: Bool? { get }
    var isLast: Bool? { get }
    
    static var eventName: String? { get }
    
}

extension ModelProtocol {
    
    func identifier() -> String {
        return ""
    }
  
    func height() -> CGFloat {
        UITableViewAutomaticDimension
    }
    
    func size() -> CGSize {
        CGSize(width: 30, height: 30)
    }
    
    var isFirst: Bool? {
        false
    }
    var isLast: Bool? {
        false
    }
    static var eventName: String? {
        "unknow"
    }
 
    
}
