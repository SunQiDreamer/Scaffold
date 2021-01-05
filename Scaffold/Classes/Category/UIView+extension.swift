//
//  UIView+extension.swift
//  Demo
//
//  Created by 孙琦 on 2020/3/4.
//  Copyright © 2020 sunqi. All rights reserved.
//

import UIKit
import SnapKit

extension UIView {
    
    private static var debugKey: Bool?
    var debug: Bool {
        set {
            NSObject.setAssociateValue(newValue, withKey: &UIView.debugKey)
            
            if newValue {
                backgroundColor = .random
            }
        }
        
        get {
            NSObject.getAssociatedValue(forKey: &UIView.debugKey) as! Bool
        }
    }
    
    // 构建view namespace 防止调用的是OC分类方法
    public var TY: ViewConstructor {
        return ViewConstructor(self)
    }
    
    @discardableResult func configration(_ block: (_ view: Self) -> ()) -> Self {
        block(self)
        return self
    }
    
    func edgesEqualToSuperview() {
        self.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
    }
    
    // 切固定的圆角，frame必须有值
    func cornerRadius(byRoundingCorners rectCorner: UIRectCorner = .allCorners, value: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: rectCorner, cornerRadii: CGSize(width: value, height: value))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = bounds
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer
    }
    
}
