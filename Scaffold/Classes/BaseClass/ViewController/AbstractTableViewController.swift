//
//  AbstractTableViewController.swift
//  MainSearch
//
//  Created by 孙琦 on 2020/4/22.
//  Copyright © 2020 Tigerobo. All rights reserved.
//

import UIKit
import DZNEmptyDataSet
import TABAnimated

class AbstractTableViewController: AbstractViewController, ListViewControllerProtocol {
    
    lazy var tableView = { () -> UITableView in
        
        var height: CGFloat = 0
        if hidesBottomBarWhenPushed {
            height = ScreenHeight() - NavBarHeight()
        } else {
            height = ScreenHeight() - NavBarHeight() - TabBarHeight()
        }
        
        let style: UITableView.Style = self.tableViewStyle()
        
        let tableView: UITableView = UITableView(frame: CGRect(x: 0, y: 0, width: ScreenWidth(), height: height), style: style)
        tableView.backgroundColor = .bgMain
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = .bgMain
        view.addSubview(tableView)
        
        handleCallBack()
        addRefreshHeader()
        addRefreshFooter()
        addEmptyDataSet()
        addTabAnimated()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // fix refresh_header回不到原始位置的bug
        tableView.mj_header?.endRefreshing()
    }
    
    func customRefreshHeader() -> MJRefreshHeader? {
        MJRefreshNormalHeader { [weak self] in
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
                tableView.mj_header = header
            } else {
                tableView.mj_header = customHeader
            }
            
            if beginRefreshEnable() {
                tableView.mj_header?.beginRefreshing()
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
                footer.stateLabel?.textColor = .textGray2
                footer.stateLabel?.font = 14.normalFont
//                footer.loadingView?.style = (UIApplication.shared.userInterfaceStyle.rawValue == TYUserInterfaceStyle.dark.rawValue) ? .white : .gray
                tableView.mj_footer = footer
            } else {
                tableView.mj_footer = customFooter
            }
            tableView.mj_footer?.isHidden = true
        }
    }
    
    private func addEmptyDataSet() {
        if emptyDataSetEnable() {
            tableView.emptyDataSetSource = self
            tableView.emptyDataSetDelegate = self
        }
    }
    
    private func addTabAnimated() {
        let a = tabAnimatedCellName()
        if a.isEmpty == false {
            
            let className = NSClassFromString(tabAnimatedCellName()) as? UITableViewCell.Type
            tableView.tabAnimated = TABTableAnimated(cellClass: className ?? UITableViewCell.self, cellHeight: tabAnimatedCellHeight())
            tableView.tab_startAnimation()
        }
    }
    
    override func viewWillRefresh() {
        super.viewWillRefresh()
        
        tableView.mj_footer?.isHidden = false
    }
    
    func beginRefreshEnable() -> Bool { true }
    
    func refreshEnable() -> Bool { true }
    
    func loadMoreEnable() -> Bool { true }
    
    func emptyDataSetEnable() -> Bool { true }
    
    func tabAnimatedCellName() -> String { "" }
    
    func tabAnimatedCellHeight() -> CGFloat { 44.scale }
    
}

extension AbstractTableViewController {
    
    /// 数据请求完回调处理
    fileprivate func handleCallBack() {
        viewModel.refreshUI = { [weak self] in
            self?.viewWillRefresh()
            
            let noMoreData = self?.viewModel.noMoreData ?? false
            
            if noMoreData {
                
                // 没有更多数据可以加载
                if self?.viewModel.pageNum == self?.viewModel.pageNumInitialize  {
                    //加载首页时就没有更多数据加载，隐藏footer
                    self?.tableView.tab_endAnimation()
                    self?.tableView.mj_footer?.isHidden = true
                    self?.tableView.mj_header?.endRefreshing()
                    
                } else {
                    //加载非首页时没有更多数据加载，设置noMoreData
                    self?.tableView.mj_footer?.endRefreshingWithNoMoreData()
                    self?.tableView.mj_footer?.isHidden = false
                }
                
                
            } else {
                //有更多数据加载
                if (self?.tableView.mj_footer?.isHidden == true) {
                    self?.tableView.mj_footer?.isHidden = false
                }
                
                if self?.viewModel.pageNum == self?.viewModel.pageNumInitialize  {
                    self?.tableView.tab_endAnimation()
                    self?.tableView.mj_header?.endRefreshing()
                    self?.tableView.mj_footer?.resetNoMoreData()
                } else {
                    self?.tableView.mj_footer?.endRefreshing()
                }
            }
            
            self?.tableView.reloadData()
            self?.viewDidRefresh()
        }
    }
    
    /// 深色浅色主题切换处理
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        let header = tableView.mj_header as? MJRefreshNormalHeader
//        header?.loadingView?.style = (UIApplication.shared.userInterfaceStyle.rawValue == TYUserInterfaceStyle.dark.rawValue) ? .white : .gray
        
        let footer = tableView.mj_footer as? MJRefreshAutoNormalFooter
//        footer?.loadingView?.style = (UIApplication.shared.userInterfaceStyle.rawValue == TYUserInterfaceStyle.dark.rawValue) ? .white : .gray
    }
    
}

// MARK: - UITableView
extension AbstractTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.height(at: indexPath)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let count = viewModel.numberOfSections()
        /// 设置section 最小为1，为0时骨架屏显示不出来
        return max(count, 1)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModel.model(at: indexPath)
        var cell = tableView.dequeueReusableCell(withIdentifier: model.identifier() )
        if cell == nil {
            let className = NSClassFromString(model.identifier() ) as! UITableViewCell.Type
            cell = className.init(style: .default, reuseIdentifier: model.identifier())
        }
        (cell as! AbstractTableCell).custom(with: model)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if view.isKind(of: UITableViewHeaderFooterView.self) {
            if let view = view as? UITableViewHeaderFooterView {
                view.backgroundView?.backgroundColor = .bgMain
            }
        }
    }
    
}


// MARK: - EmptyDataSet
extension AbstractTableViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
//        if XMCenter.isNetworkReachable() {
//            return Image(name: "no_content")
//        } else {
//            return Image(name: "no_wifi")
//        }
        
        return Image(name: "no_content")
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
