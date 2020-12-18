//
//  AbstractCollectionCell.swift
//  MainSearch
//
//  Created by 孙琦 on 2020/5/28.
//  Copyright © 2020 Tigerobo. All rights reserved.
//

import Foundation

class AbstractCollectionCell: UICollectionViewCell, ViewProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubviews() {
        contentView.backgroundColor = .bgMain
    }

    // func custom(with data: TYModelProtocol) { }
    
    func custom(with data: ModelProtocol) { }

    func custom(with text: String) { }
    
//    deinit {
//        print("=======================================")
//        print("deinit----【\(self)】")
//        print("=======================================")
//    }
        
}
