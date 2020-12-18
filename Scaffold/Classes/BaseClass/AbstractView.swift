//
//  AbstractView.swift
//  MainSearch
//
//  Created by 孙琦 on 2020/4/20.
//  Copyright © 2020 Tigerobo. All rights reserved.
//

import UIKit
import RxSwift

class AbstractView: UIView, ViewProtocol {
    
    lazy var disposeBag = DisposeBag()
    
    func custom(with data: ModelProtocol) { }
    
    func custom(with text: String) { }
    
//    func custom(with data: TYModelProtocol) { }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubviews() {}
}
