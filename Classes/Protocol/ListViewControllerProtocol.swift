//
//  ListViewControllerProtocol.swift
//  MainSearch
//
//  Created by 孙琦 on 2020/4/22.
//  Copyright © 2020 Tigerobo. All rights reserved.
//

import Foundation

protocol ListViewControllerProtocol: ViewControllerProtocol {    
    /// 是否可以下拉刷新，返回YES可以下拉刷新
    func refreshEnable() -> Bool
    
    ///  是否可以上拉加载更多，返回YES可以上拉加载更多
    func loadMoreEnable() -> Bool
    
    ///  是否进页面刷新
    func beginRefreshEnable() -> Bool
    
    ///  是否有空数据页面
    func emptyDataSetEnable() -> Bool
    
    /// 骨架图的cell名称
    func tabAnimatedCellName() -> String
    
    /// 骨架图的cell高度  tableView
    func tabAnimatedCellHeight() -> CGFloat
    
    /// 骨架图的cell size  collectionView
    func tabAnimatedCellSize() -> CGSize
    
    
    func tableViewStyle() -> UITableView.Style
    
    // 自定义刷新控件
    func customRefreshHeader() -> MJRefreshHeader?
    func customRefreshFooter() -> MJRefreshFooter?
}


extension ListViewControllerProtocol {
    func emptyDataSetEnable() -> Bool { true }
    func tabAnimatedCellHeight() -> CGFloat { 44 }
    func tableViewStyle() -> UITableView.Style { .plain }
    
    func tabAnimatedCellName() -> String { "" }
    func tabAnimatedCellSize() -> CGSize { .zero }
    

    func customRefreshHeader() -> MJRefreshHeader? { nil }
    func customRefreshFooter() -> MJRefreshFooter? { nil }
       
}


protocol ViewControllerProtocol {
    func navigationBarHidden() -> Bool
    
    // 页面即将刷新，由子类实现
    func viewWillRefresh()
    
    // 页面已经刷新，由子类实现
    func viewDidRefresh()
    
    ///自定义viewModel类型，默认的viewModel是与控制器同名的viewModel类，控制器实现该方法可以替换为其他的viewModel类，该viewModel必须实现TYViewModelProtocol
    ///与控制器同名的viewModel指的是，例：控制器xxAAViewController--->xxAAViewModel
    func viewModelClass() -> AbstractTableViewModel.Type?
}

extension ViewControllerProtocol {
   func viewModelClass() -> AbstractTableViewModel.Type? { nil }
    
}
