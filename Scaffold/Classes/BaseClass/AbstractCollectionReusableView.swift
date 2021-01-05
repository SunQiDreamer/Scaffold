//
//  AbstractCollectionReusableView.swift
//  MainSearch
//
//  Created by 孙琦 on 2020/5/28.
//  Copyright © 2020 sunqi. All rights reserved.
//

import Foundation


class AbstractCollectionReusableView: UICollectionReusableView, ViewProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubviews() {
        backgroundColor = .bgMain
    }
    
    func custom(with data: ModelProtocol) {}
    
//    func custom(with data: TYModelProtocol) {}
    
    func custom(with text: String) {}

}
