//
//  AbstractTableCell.swift
//  MainSearch
//
//  Created by 孙琦 on 2020/4/22.
//  Copyright © 2020 Tigerobo. All rights reserved.
//

import UIKit

class AbstractTableCell: UITableViewCell, ViewProtocol {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubviews() {
        selectionStyle = .none
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
