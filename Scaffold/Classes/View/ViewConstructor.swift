//
//  ViewConstructor.swift
//  MainSearch
//
//  Created by 孙琦 on 2020/4/17.
//  Copyright © 2020 sunqi. All rights reserved.
//

import UIKit
import SnapKit

public typealias makeContraints = (_ make: ConstraintMaker) -> ()

public struct ViewConstructor {
    
    var view: UIView!
    
    init(_ view: UIView) {
        self.view = view
    }
    
    private init() {}
    
    // MARK: - Separator
    @discardableResult public func addSeparator(lineHeight: CGFloat = 0.5,
                                                color: UIColor = .line,
                                                make: makeContraints?) -> UIView {
        let line = UIView()
        line.backgroundColor = color;
        view.addSubview(line)
        line.snp.makeConstraints { (maker) in
            maker.height.equalTo(lineHeight)
            make?(maker)
        }
        return line
    }
    
    @discardableResult public func addSeparator(lineHeight: CGFloat = 0.5,
                                                color: UIColor = .line,
                                                inset: UIEdgeInsets = .zero) -> UIView {
        let line = UIView()
        line.backgroundColor = color;
        view.addSubview(line)
        
        line.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview().inset(inset.left)
            maker.right.equalToSuperview().inset(inset.right)
            maker.bottom.equalToSuperview().inset(inset.bottom)
            maker.height.equalTo(lineHeight)
        }
        return line
    }
    
    
    // MARK: - View
    @discardableResult public func addView(debug: Bool = false,
                                           backgroundColor: UIColor? = nil,
                                           make: makeContraints?,
                                           configuration: ((_ view: UIView) -> ())? = nil) -> UIView {
        
        let addView = UIView()
        addView.backgroundColor = (backgroundColor != nil) ? backgroundColor : view.backgroundColor
        configuration?(addView)
        
        #if DEBUG
        addView.debug = debug
        #endif
        
        view.addSubview(addView)
        addView.snp.makeConstraints { (maker) in
            make?(maker)
        }
        return addView
    }
    
    // MARK: - Label
    @discardableResult public func addLabel(text: String? = nil,
                                            textColor: UIColor = .textMain,
                                            font: UIFont = .systemFont(ofSize: 14),
                                            backgroundColor: UIColor? = nil,
                                            make: makeContraints?,
                                            configuration: ((_ label: UILabel) -> ())? = nil) -> UILabel {
        let label = UILabel()
        if text != nil {
            label.text = text
        }
        label.font = font
        label.textColor = textColor
        label.backgroundColor = (backgroundColor != nil) ? backgroundColor : view.backgroundColor
        /// 防止图层混合  显示中文时，控件区域会超出文字区域，四周会产生图层混合的情况
        label.layer.masksToBounds = true
        
        configuration?(label)
        view.addSubview(label)
        
        label.snp.makeConstraints { (maker) in
            make?(maker)
        }
        return label
    }
    
    // MARK: - ImageView
    @discardableResult public func addImageView(image: UIImage? = nil,
                                                backgroundColor: UIColor? = nil,
                                                make: makeContraints?,
                                                configuration: ((_ imageView: UIImageView) -> ())? = nil) -> UIImageView {
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.backgroundColor = (backgroundColor != nil) ? backgroundColor : view.backgroundColor
        configuration?(imageView)
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (maker) in
            if let make = make {
                make(maker)
            }
        }
        return imageView
    }
    
    // MARK: - Button
    @discardableResult public func addButton(text: String? = nil,
                                             textColor: UIColor = .textMain,
                                             font: UIFont = .systemFont(ofSize: 14),
                                             image: UIImage? = nil,
                                             make: makeContraints?,
                                             configuration: ((_ button: UIButton) -> ())? = nil,
                                             clicked:((_ button: UIButton) -> ())? = nil) -> UIButton {
        
        let btn = UIButton(type: .custom)
        btn.setTitle(text, for: .normal)
        btn.setTitleColor(textColor, for: .normal)
        btn.titleLabel?.font = font
        btn.setImage(image, for: .normal)
        configuration?(btn)
        view.addSubview(btn)
        btn.addBlock(for: .touchUpInside) { [unowned btn] (_) in
            clicked?(btn)
        }
        btn.snp.makeConstraints { (maker) in
            make?(maker)
        }
        return btn
    }
    
    @discardableResult public func addImageButton(image: UIImage? = nil,
                                                  make: makeContraints?,
                                                  configuration: ((_ button: UIButton) -> ())? = nil,
                                                  clicked:((_ button: UIButton) -> ())? = nil) -> UIButton {
        
        let btn = UIButton(type: .custom)
        btn.setImage(image, for: .normal)
        configuration?(btn)
        view.addSubview(btn)
        btn.addBlock(for: .touchUpInside) { [unowned btn] (_) in
            clicked?(btn)
        }
        btn.snp.makeConstraints { (maker) in
            make?(maker)
        }
        return btn
    }
    
    @discardableResult public func addExpandButton(text: String? = nil,
                                                   textColor: UIColor = .textMain,
                                                   font: UIFont = .systemFont(ofSize: 14),
                                                   image: UIImage? = nil,
                                                   make: makeContraints?,
                                                   configuration: ((_ button: UIButton) -> ())? = nil,
                                                   clicked:((_ button: UIButton) -> ())? = nil) -> UIButton {
        
        let btn = ExpandButton(type: .custom)
        btn.setTitle(text, for: .normal)
        btn.setTitleColor(textColor, for: .normal)
        btn.titleLabel?.font = font
        btn.setImage(image, for: .normal)
        configuration?(btn)
        view.addSubview(btn)
        btn.addBlock(for: .touchUpInside) { [unowned btn] (_) in
            clicked?(btn)
        }
        btn.snp.makeConstraints { (maker) in
            make?(maker)
        }
        return btn
    }
    
    @discardableResult public func addTitleButton(text: String? = nil,
                                                  textColor: UIColor = .textMain,
                                                  font: UIFont = .systemFont(ofSize: 14),
                                                  make: makeContraints?,
                                                  configuration: ((_ button: UIButton) -> ())? = nil,
                                                  clicked:((_ button: UIButton) -> ())? = nil) -> UIButton {
        
        let btn = UIButton(type: .custom)
        btn.setTitle(text, for: .normal)
        btn.setTitleColor(textColor, for: .normal)
        btn.titleLabel?.font = font
        configuration?(btn)
        view.addSubview(btn)
        btn.addBlock(for: .touchUpInside) { [unowned btn] (_) in
            clicked?(btn)
        }
        btn.snp.makeConstraints { (maker) in
            make?(maker)
        }
        return btn
    }
    
    @discardableResult public func addIcon(text: String? = nil,
                                           textColor: UIColor = .textMain,
                                           font: UIFont = .systemFont(ofSize: 14),
                                           make: makeContraints?,
                                           configuration: ((_ button: UIButton) -> ())? = nil,
                                           clicked:((_ button: UIButton) -> ())? = nil) -> UIButton {
        
        let btn = UIButton(type: .custom)
        btn.setTitle(text, for: .normal)
        btn.setTitleColor(textColor, for: .normal)
        btn.titleLabel?.font = font
        configuration?(btn)
        view.addSubview(btn)
        btn.addBlock(for: .touchUpInside) { [unowned btn] (_) in
            clicked?(btn)
        }
        btn.snp.makeConstraints { (maker) in
            make?(maker)
        }
        return btn
    }
    
    // MARK: - stackView
    @discardableResult public func addStackView(arrangedSubviews: Array<UIView> = [],
                                                axis: NSLayoutConstraint.Axis = .horizontal,
                                                distribution: UIStackView.Distribution = .fillEqually,
                                                alignment: UIStackView.Alignment = .fill,
                                                make: makeContraints?,
                                                configuration: ((_ stackView: UIStackView) -> ())? = nil) -> UIStackView {
        
        let stackView = UIStackView(arrangedSubviews:arrangedSubviews)
        stackView.axis = axis
        stackView.distribution = distribution
        stackView.alignment = alignment
        
        configuration?(stackView)
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { (maker) in
            make?(maker)
        }
        return stackView
    }
    
    /// 行 灵感来自于flutter
    @discardableResult public func addRow(arrangedSubviews: Array<UIView> = [],
                                          distribution: UIStackView.Distribution = .fillEqually,
                                          alignment: UIStackView.Alignment = .fill,
                                          make: makeContraints?,
                                          configuration: ((_ stackView: UIStackView) -> ())? = nil) -> UIStackView {
        
        let stackView = UIStackView(arrangedSubviews:arrangedSubviews)
        stackView.axis = .horizontal
        stackView.distribution = distribution
        stackView.alignment = alignment
        
        configuration?(stackView)
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { (maker) in
            make?(maker)
        }
        return stackView
    }
    
    
    /// 列 灵感来自于flutter
    @discardableResult public func addColumn(arrangedSubviews: Array<UIView> = [],
                                             distribution: UIStackView.Distribution = .fillEqually,
                                             alignment: UIStackView.Alignment = .fill,
                                             make: makeContraints?,
                                             configuration: ((_ stackView: UIStackView) -> ())? = nil) -> UIStackView {
        
        let stackView = UIStackView(arrangedSubviews:arrangedSubviews)
        stackView.axis = .vertical
        stackView.distribution = distribution
        stackView.alignment = alignment
        
        configuration?(stackView)
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { (maker) in
            make?(maker)
        }
        return stackView
    }
    
    // MARK: - Card
    @discardableResult public func addCard(backgroundColor: UIColor? = nil,
                                           cornerRadius: CGFloat = CGFloatScale(5),
                                           elevation: CGFloat = 0,
                                           make: makeContraints?,
                                           configuration: ((_ view: UIView) -> ())? = nil) -> UIView {
        
        let addView = UIView()
        addView.backgroundColor = (backgroundColor != nil) ? backgroundColor : view.backgroundColor
        addView.layer.cornerRadius = cornerRadius
        addView.layer.shadowRadius = elevation
        configuration?(addView)
        view.addSubview(addView)
        addView.snp.makeConstraints { (maker) in
            make?(maker)
        }
        return addView
    }
    
    // MARK: - icon 如果同时复赋值了image和icon,优先使用icon
    @discardableResult public func addIcon(image: UIImage? = nil,
                                           icon: String? = nil,
                                           size: CGFloat,
                                           color: UIColor,
                                           make: makeContraints?,
                                           configuration: ((_ view: UIImageView) -> ())? = nil) -> UIImageView {
        
        let imageView = UIImageView()
        var innerImage: UIImage?
        if let icon = icon {
            //            innerImage = TYIcon.icon(withName: icon, size: size, color: color)
        } else {
            innerImage = image
        }
        imageView.image = innerImage
        configuration?(imageView)
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (maker) in
            maker.size.equalTo(CGSize(width: size, height: size))
            if let make = make {
                make(maker)
            }
        }
        return imageView
    }
    
    
    @discardableResult public func addImageIcon(image: UIImage? = nil,
                                                make: makeContraints?,
                                                configuration: ((_ view: UIImageView) -> ())? = nil) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = image
        configuration?(imageView)
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (maker) in
            maker.size.equalTo(image?.size ?? .zero)
            if let make = make {
                make(maker)
            }
        }
        return imageView
    }
    
    
    @discardableResult public func addFontIcon(icon: String? = nil,
                                               size: CGFloat,
                                               color: UIColor,
                                               make: makeContraints?,
                                               configuration: ((_ view: UIImageView) -> ())? = nil) -> UIImageView {
        
        return addIcon(icon: icon, size: size, color: color, make: make, configuration: configuration)
    }
    
}
