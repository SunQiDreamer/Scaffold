//
//  DemoCell.swift
//  Scaffold_Example
//
//  Created by 孙琦 on 2021/1/4.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import Scaffold

class DemoCell: AbstractTableCell {
    
    var nameLabel: UILabel!

    override func initSubviews() {
        super.initSubviews()
        
        nameLabel = contentView.TY.addLabel(textColor: .textMain, font: .systemFont(ofSize: CGFloatScale(14)), backgroundColor: .bgMain, make: { (maker) in
            maker.left.equalTo(CGFloatScale(15))
            maker.top.equalTo(CGFloatScale(15))
        })
    }
    
    override func custom(with data: ModelProtocol) {
        let model = data as? DemoModel
        nameLabel.text = model?.title
    }
}
