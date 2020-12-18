//
//  CommonSwift.swift
//  MainSearch
//
//  Created by 孙琦 on 2020/2/19.
//  Copyright © 2020 Tigerobo. All rights reserved.
//

import Foundation

public typealias Task = () -> Void

func KeyWindow() -> UIWindow? {
    return UIApplication.shared.keyWindow
}

func Log<T>(_ msg: T, file: NSString = #file, line: Int = #line, fn: NSString = #function)  {
    #if DEBUG
    let prefix = "\(file.lastPathComponent)_\(line)_\(fn):"
    print(prefix, msg)
    #endif
}

func ScreenFrame() -> CGRect { UIScreen.main.bounds }

func ScreenWidth() -> CGFloat { UIScreen.main.bounds.size.width }

func ScreenHeight() -> CGFloat { UIScreen.main.bounds.size.height }

func NavBarHeight() -> CGFloat {
    let top = SafeAreaInsets().top
    return NavBarNormalHeight() + top
}

func NavBarNormalHeight() -> CGFloat { 44.0 }

func TabBarHeight() -> CGFloat {
    return 49 + SafeAreaInsets().bottom
}

func SafeAreaInsets() -> UIEdgeInsets {
    if #available(iOS 11.0, *) {
        return KeyWindow()?.safeAreaInsets ?? .zero
    } else {
        return .zero
    }
}

func ClassFromString(_ aClassName: String) -> AnyClass? {
    var className: AnyClass? = NSClassFromString(aClassName)
    if className == nil {
        let namespace = Bundle.main.infoDictionary?["CFBundleExecutable"] as? String
        className = NSClassFromString("\(namespace ?? "").\(aClassName)")
    }
    return className
}

func Image(name: String) -> UIImage? {
    return UIImage(named: name)
}

//func IconName(name: String) -> String {
//    TYIcon.matchCode(withName: name)
//}
//
///// 是否登录
//func isLogin() -> Bool {
//    GQUserInfoManager.share().isLogin()
//}

func floor(_ value: CGFloat) -> CGFloat {
     value.rounded(.down)
}

func ceil(_ value: CGFloat) -> CGFloat {
    value.rounded(.up)
}

