//
//  AbstractCollectionViewController.swift
//  MainSearch
//
//  Created by 孙琦 on 2020/7/10.
//  Copyright © 2020 Tigerobo. All rights reserved.
//

import Foundation
import RxSwift
import MJRefresh
import DZNEmptyDataSet
import TABAnimated

class AbstractCollectionViewController: UIViewController, ListViewControllerProtocol {
    
    lazy var disposeBag = DisposeBag()
    
    // 注册的cell
    private var registerdCells: [String] = []
    
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
    
    lazy var collectionView = { () -> UICollectionView in
        
        var height: CGFloat = 0
        if hidesBottomBarWhenPushed {
            height = ScreenHeight() - NavBarHeight()
        } else {
            height = ScreenHeight() - NavBarHeight() - TabBarHeight()
        }
        
        let flowLayout = UICollectionViewFlowLayout()
        
        let spaces = minimumLSpacing()
        flowLayout.minimumLineSpacing = spaces.minimumLineSpacing
        flowLayout.minimumInteritemSpacing = spaces.minimumInteritemSpacing
        
        let collectionView: UICollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: ScreenWidth(), height: height), collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .bgMain
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        
        return collectionView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = .bgMain
        view.addSubview(collectionView)
        
        handleCallBack()
        addRefreshHeader()
        addRefreshFooter()
        addEmptyDataSet()
        addTabAnimated()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // fix refresh_header回不到原始位置的bug
        collectionView.mj_header?.endRefreshing()
    }
    
    func viewWillRefresh() {
        registerCell()
    }
    
    func viewDidRefresh() {}
    
    private func registerCell() {
        viewModel.dataSource.forEach { (model) in
            let identifier = model.identifier()
            if !self.registerdCells.contains(identifier) {
                let className: AnyClass? = NSClassFromString(identifier)
                self.collectionView.register(className, forCellWithReuseIdentifier: identifier)
                self.registerdCells.append(identifier)
            }
        }
    }
    
    func customRefreshHeader() -> MJRefreshHeader? {
        GQAnimationRefreshHeader { [weak self] in
            self?.viewModel.refreshData()
        }
    }
    
    // 添加下拉刷新控件
    private func addRefreshHeader() {
        if refreshEnable() {
            
            let customHeader = customRefreshHeader()
            if customHeader == nil {
                let header = MJRefreshNormalHeader { [weak self] in
                    self?.viewModel.refreshData()
                }
                header.lastUpdatedTimeLabel?.isHidden = true
                header.stateLabel?.font = .systemFont(ofSize: 14)
                header.stateLabel?.textColor = .textGray3
//                header.loadingView?.style = (UIApplication.shared.userInterfaceStyle.rawValue == TYUserInterfaceStyle.dark.rawValue) ? .white : .gray
                collectionView.mj_header = header
            } else {
                collectionView.mj_header = customHeader
            }
            
            if beginRefreshEnable() {
                collectionView.mj_header?.beginRefreshing()
            }
        }
    }
    
    // 添加上拉加载更多控件
    private func addRefreshFooter() {
        if loadMoreEnable() {
            
            let customFooter = customRefreshFooter()
            
            if customFooter == nil {
                let footer = MJRefreshAutoNormalFooter { [weak self] in
                    self?.viewModel.loadMore()
                }
//                footer.loadingView?.style = (UIApplication.shared.userInterfaceStyle.rawValue == TYUserInterfaceStyle.dark.rawValue) ? .white : .gray
                footer.stateLabel?.textColor = .textGray2
                footer.stateLabel?.font = 14.normalFont
                collectionView.mj_footer = footer
            } else {
                collectionView.mj_footer = customFooter
            }
        }
    }
    
    private func addEmptyDataSet() {
        if emptyDataSetEnable() {
            collectionView.emptyDataSetSource = self
            collectionView.emptyDataSetDelegate = self
        }
    }
    
    private func addTabAnimated() {
        let a = tabAnimatedCellName()
        if a.isEmpty == false {
            
            let className = NSClassFromString(tabAnimatedCellName()) as? UITableViewCell.Type
            collectionView.tabAnimated = TABCollectionAnimated(cellClass: className ?? UICollectionViewCell.self, cellSize: tabAnimatedCellSize())
            collectionView.tab_startAnimation()
        }
    }
    
    func beginRefreshEnable() -> Bool { true }
    
    func refreshEnable() -> Bool { true }
    
    func loadMoreEnable() -> Bool { true }
    
    func emptyDataSetEnable() -> Bool { true }
    
    func tabAnimatedCellName() -> String { "" }
    
    func tabAnimatedCellHeight() -> CGFloat { 44.scale }
    
    func navigationBarHidden() -> Bool { false }
    
    func minimumLSpacing() -> (minimumLineSpacing: CGFloat, minimumInteritemSpacing: CGFloat) { (0, 0) }
//    deinit {
//        print("=======================================")
//        print("deinit----【\(self)】")
//        print("=======================================")
//    }
    
}

extension AbstractCollectionViewController {
    
    /// 数据请求完回调处理
    fileprivate func handleCallBack() {
        viewModel.refreshUI = { [weak self] in
            self?.viewWillRefresh()
            
            let noMoreData = self?.viewModel.noMoreData ?? false
            
            if noMoreData {
                
                // 没有更多数据可以加载
                if self?.viewModel.pageNum == self?.viewModel.pageNumInitialize  {
                    //加载首页时就没有更多数据加载，隐藏footer
                    self?.collectionView.tab_endAnimation()
                    self?.collectionView.mj_footer?.isHidden = true
                    self?.collectionView.mj_header?.endRefreshing()
                    
                } else {
                    //加载非首页时没有更多数据加载，设置noMoreData
                    self?.collectionView.mj_footer?.endRefreshingWithNoMoreData()
                    self?.collectionView.mj_footer?.isHidden = false
                }
                
                
            } else {
                //有更多数据加载
                if (self?.collectionView.mj_footer?.isHidden == true) {
                    self?.collectionView.mj_footer?.isHidden = false
                }
                
                if self?.viewModel.pageNum == self?.viewModel.pageNumInitialize  {
                    self?.collectionView.tab_endAnimation()
                    self?.collectionView.mj_header?.endRefreshing()
                    
                } else {
                    self?.collectionView.mj_footer?.endRefreshing()
                }
            }
            
            self?.collectionView.reloadData()
            self?.viewDidRefresh()
        }
    }
    
    /// 深色浅色主题切换处理
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        let header = collectionView.mj_header as? MJRefreshNormalHeader
//        header?.loadingView?.style = (UIApplication.shared.userInterfaceStyle.rawValue == TYUserInterfaceStyle.dark.rawValue) ? .white : .gray
        
        let footer = collectionView.mj_footer as? MJRefreshAutoNormalFooter
//        footer?.loadingView?.style = (UIApplication.shared.userInterfaceStyle.rawValue == TYUserInterfaceStyle.dark.rawValue) ? .white : .gray
    }
    
}

// MARK: - UITableView
extension AbstractCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let count = viewModel.numberOfSections()
        /// 设置section 最小为1，为0时骨架屏显示不出来
        return max(count, 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = viewModel.model(at: indexPath)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: model.identifier(), for: indexPath)
     
        (cell as! AbstractCollectionCell).custom(with: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        viewModel.sizeForItem(at: indexPath)
    }
  
}


// MARK: - EmptyDataSet
extension AbstractCollectionViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return Image(name: "no_content")
//        if XMCenter.isNetworkReachable() {
//            return Image(name: "no_content")
//        } else {
//            return Image(name: "no_wifi")
//        }
    }
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControl.State) -> NSAttributedString! {
        return NSAttributedString(string: "暂无数据", attributes: [.font: UIFont.systemFont(ofSize: 15), .foregroundColor: UIColor.lightGray])
//        if XMCenter.isNetworkReachable() {
//
//            return NSAttributedString(string: "暂无数据", attributes: [.font: UIFont.systemFont(ofSize: 15), .foregroundColor: UIColor.lightGray])
//
//        } else {
//
//            let text = "网络不给力，请点击重试"
//            let attStr = NSMutableAttributedString(string: text, attributes: [.font: UIFont.systemFont(ofSize: 15), .foregroundColor: UIColor.lightGray])
//            attStr.addAttribute(.foregroundColor, value: UIColor(hexString: "0x007EE5") ?? UIColor.textMain, range: NSRange(location: 7, length: 4))
//
//            return attStr;
//
//        }
    }
    
    func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
        // moMoreData默认是false,当值为true时说明已经进行了网络请求
        viewModel.dataSource.count == 0 && viewModel.noMoreData
    }
    
    func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!) {
        viewModel.refreshData()
    }
    
}
