//
//  AbstractViewController.swift
//  MainSearch
//
//  Created by 孙琦 on 2020/4/17.
//  Copyright © 2020 Tigerobo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import YYCategories

class AbstractViewController: UIViewController, UIGestureRecognizerDelegate, ViewControllerProtocol {
    
    //    创建viewModel
    lazy var viewModel: AbstractTableViewModel = { () -> AbstractTableViewModel in
        var vmClass = viewModelClass()
        if vmClass == nil {
            let vcClassName = NSStringFromClass(type(of: self))
            let vmClassName = (vcClassName as NSString).replacingOccurrences(of: "ViewController", with: "ViewModel")
            vmClass = NSClassFromString(vmClassName) as? AbstractTableViewModel.Type
        }
        
        return vmClass!.init()
    }()
    
    lazy var disposeBag = DisposeBag()
    
    func viewWillRefresh() {}
    
    func viewDidRefresh() {}
    
    func navigationBarHidden() -> Bool {
        return false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        initSubviews()
        
        // 自定义返回按钮，右滑返回会失效，添加这一行，使其生效
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        handleCallBack()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if navigationBarHidden() {
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if navigationBarHidden() {
            self.navigationController?.setNavigationBarHidden(true, animated: false)
        }
    }
    
    func initSubviews() {
        view.backgroundColor = UIColor.bgMain
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.textMain,  NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)]
        navigationController?.navigationBar.titleTextAttributes = attributes
    }
    
    func updateSubviews() {
        
    }
    
    func handleLoginStatus() -> Bool {
//        if !isLogin() {
//            let nav = UINavigationController(rootViewController: TYAuthCodeLoginVC())
//            nav.navigationBar.barTintColor = .bgMain
//            nav.modalPresentationStyle = .fullScreen
//            present(nav, animated: true, completion: nil)
//            return false
//        }
        return true
    }
    
    override var shouldAutorotate: Bool {
        false
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        .portrait
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }

}

extension AbstractViewController {
    
    /// 数据请求完回调处理
    fileprivate func handleCallBack() {
        viewModel.refreshUI = { [weak self] in
            self?.viewWillRefresh()
            self?.updateSubviews()
            self?.viewDidRefresh()
        }
    }
    
    func rightImageBarButtonItem(_ image: UIImage, inset: UIEdgeInsets = .zero, block: @escaping () -> ()) -> UIBarButtonItem {
        
        let button = ExpandButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: image.size.width + inset.left + inset.right, height: image.size.height + inset.top + inset.bottom)
        button.imageEdgeInsets = inset
        button.setImage(image, for: .normal)
        button.rx.tap.subscribe(onNext: { (_) in
            block()
        }).disposed(by: disposeBag)
        
        let item = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = item
        
        return item
    }
    
    func rightTitleBarButtonItem(_ title: String, titleColor: UIColor = .textMain, font: UIFont = 14.normalFont, inset: UIEdgeInsets = .zero, block: @escaping () -> ()) -> UIBarButtonItem {
        
        let button = ExpandButton(type: .custom)
        
        let width = (title as NSString).width(for: font )
        let heigth = (title as NSString).height(for: font , width: width)
        button.frame = CGRect(x: 0, y: 0, width: width + inset.left + inset.right, height: heigth + inset.top + inset.bottom)
        button.titleEdgeInsets = inset
        
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = font
        button.setTitleColor(titleColor, for: .normal)
        
        button.rx.tap.subscribe(onNext: { (_) in
            block()
        }).disposed(by: disposeBag)
        
        let item = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = item
        
        return item
    }
    
}
