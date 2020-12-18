//
//  AbstractPageViewController.swift
//  MainSearch
//
//  Created by 孙琦 on 2020/7/28.
//  Copyright © 2020 Tigerobo. All rights reserved.
//

import Foundation
import JXSegmentedView
import JXPagingView

// 刷新方式
enum PagingRefresh {
    case none
    case header
    case list
}

extension JXPagingListContainerView: JXSegmentedViewListContainer {}

let pageSegmentHeight = 42.scale

class AbstractPageViewController: AbstractViewController {
    
    var pagingView: JXPagingView?
    var segmentedViewDataSource: JXSegmentedTitleDataSource?
    var segmentedView: JXSegmentedView?
    
    var userHeaderView: UIView?
    var childVcs: [JXPagingViewListViewDelegate] = []
    var titles: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

//        setBackItem()
        
        self.initSubViews()
    }
    
    func initSubViews() {
        userHeaderView = headerView()
        
        let childs = childViewController()
        
        guard childs.count > 0 else {
            return
        }
        
        childVcs = childs
        segmentedViewDataSource = JXSegmentedTitleDataSource()
        
        segmentedViewDataSource?.titles = sectionTitles()
        segmentedViewDataSource?.titleSelectedColor = .textMain
        segmentedViewDataSource?.titleNormalColor = .textGray5
        segmentedViewDataSource?.titleSelectedFont = 16.semiboldFont
        segmentedViewDataSource?.titleNormalFont = 16.normalFont
        segmentedViewDataSource?.isTitleColorGradientEnabled = true
        
        segmentedView = JXSegmentedView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: pageSegmentHeight))
        segmentedView?.delegate = self
        segmentedView?.contentEdgeInsetLeft = 31.scale
        segmentedView?.contentEdgeInsetRight = 190.scale
        segmentedView?.backgroundColor = .bgMain
        segmentedView?.dataSource = segmentedViewDataSource
        segmentedView?.isContentScrollViewClickTransitionAnimationEnabled = false
        segmentedView?.TY.addSeparator()
        
        let lineView = JXSegmentedIndicatorLineView()
        lineView.indicatorColor = .textBlue
        lineView.indicatorCornerRadius = 0
        lineView.indicatorWidth = 16.scale
        lineView.indicatorHeight = 3.scale
        segmentedView?.indicators = [lineView]
        
        switch refresh() {
        case .none:
            pagingView = JXPagingView(delegate: self)
        case .header:
            pagingView = JXPagingView(delegate: self)
        case .list:
            pagingView = JXPagingListRefreshView(delegate: self)
        }
        if let pagingView = pagingView {
            self.view.addSubview(pagingView)
            segmentedView?.listContainer = pagingView.listContainerView
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        pagingView?.frame = self.view.bounds
    }
    
    // 子类重写添加控制器
    func childViewController() -> [JXPagingViewListViewDelegate] {
        return []
    }
    
    // 默认是没有头部的，需要添加头部，子类重写方法
    func headerView() -> UIView? {
        return UIView()
    }
    
    func sectinHeight() -> CGFloat {
        pageSegmentHeight
    }
    
    func sectionTitles() -> [String] {
        return []
    }
    
    func reloadData() {
        self.pagingView?.reloadData()
    }
    
    // 更改刷新方式，子类需要重写方法，然后在childvc中添加刷新控件
    func refresh() -> PagingRefresh {
        .none
    }
    
    func pagingSelected(_ index: Int) {
        
    }
    
}

extension AbstractPageViewController: JXPagingViewDelegate {
    
    func tableHeaderViewHeight(in pagingView: JXPagingView) -> Int {
        Int(userHeaderView?.height ?? 0)
    }
    
    func tableHeaderView(in pagingView: JXPagingView) -> UIView {
        userHeaderView ?? UIView()
    }
    
    func heightForPinSectionHeader(in pagingView: JXPagingView) -> Int {
        return Int(sectinHeight())
    }
    
    func viewForPinSectionHeader(in pagingView: JXPagingView) -> UIView {
        return segmentedView ?? UIView()
    }
    
    func numberOfLists(in pagingView: JXPagingView) -> Int {
        childVcs.count
    }
    
    func pagingView(_ pagingView: JXPagingView, initListAtIndex index: Int) -> JXPagingViewListViewDelegate {
        childVcs[index]
    }
}

extension AbstractPageViewController: JXSegmentedViewDelegate {
    func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
        pagingSelected(index)
    }
}
