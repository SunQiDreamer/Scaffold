//
//  ViewModelProtocol.swift
//  MainSearch
//
//  Created by 孙琦 on 2020/2/19.
//  Copyright © 2020 sunqi. All rights reserved.
//

import Foundation

protocol ViewModelProtocol {
     
    func loadData() 
    
    func mockData()
    
    func cacheData() -> Bool
    
    /// 自定义读取缓存后操作
    func cacheConfig(data: inout ModelProtocol)
}

extension ViewModelProtocol {
    
//   func loadData()  {}
    
    func mockData()  {}
    
    func cacheData() -> Bool  {
        return true
    }
    
    /// 自定义读取缓存后操作
    func cacheConfig(data: inout ModelProtocol) {
        
    }
}
