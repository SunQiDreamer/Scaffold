//
//  User.swift
//  Scaffold
//
//  Created by 孙琦 on 2020/12/19.
//

import Foundation

class User {
    static let share = User()
    private init() {}
    
    var isLogin: Bool {
        return true
    }
}
