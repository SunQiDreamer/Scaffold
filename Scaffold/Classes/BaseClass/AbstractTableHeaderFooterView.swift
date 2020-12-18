//
//  AbstractTableHeaderFooterView.swift
//  MainSearch
//
//  Created by 孙琦 on 2020/8/7.
//  Copyright © 2020 Tigerobo. All rights reserved.
//

import Foundation


class AbstractTableHeaderFooterView: UITableViewHeaderFooterView, ViewProtocol {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        initSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubviews() {
        contentView.backgroundColor = .bgMain
    }
    
    func custom(with data: ModelProtocol) { }
    
    func custom(with text: String) { }
    
//    func custom(with data: TYModelProtocol) { }
    
//    deinit {
//        print("=======================================")
//        print("deinit----【\(self)】")
//        print("=======================================")
//    }
    
}
