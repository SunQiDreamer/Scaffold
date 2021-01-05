//
//  AbstractTableViewModel.swift
//  MainSearch
//
//  Created by 孙琦 on 2020/4/22.
//  Copyright © 2020 sunqi. All rights reserved.
//

import Foundation
import RxSwift
import YYCache

open
class AbstractTableViewModel: ViewModelProtocol {
    
    let pageNumInitialize = 1
    var pageSize = 30
    var pageNum: Int = 1
    var noMoreData = false
    lazy var cache = YYCache(name: String(describing: type(of: self)))
    var refreshUI: (() -> ())? = nil
    lazy var disposeBag = DisposeBag()
    var ts: [ModelProtocol] = []
    required public init() {}
    
    open var dataSource = Array<ModelProtocol>() {
        didSet {
            update()
        }
    }
    
    private func update() {
        DispatchQueue.main.async {
            self.viewModelWillUpdateDataSource()
        }
        
//        if dataSource.count == 0 {
//            noMoreData = false
//            //  - 读取缓存
//            if cacheData() {
//                var tmps = [ModelProtocol]()
//
//                for index in 0..<pageSize {
//                    var obj = cache?.object(forKey: "\(index)") as! ModelProtocol
//                    // 自定义操作
//                    cacheConfig(data: &obj)
//                    tmps.append(obj)
//                }
//                dataSource = tmps
//            }
//        } else {
//            // 存储数据,目前只存储了第一页数据
//            if cacheData() && pageNum == pageNumInitialize {
//                for (index, model) in dataSource.enumerated() {
//                    cache?.setObject(model as? NSCoding, forKey: "\(index)")
//                }
//            }
//        }
        
        DispatchQueue.main.async {
            self.refreshUI?()
            self.viewModelDidUpdateDataSource()
        }
    }
    
    open
    func loadData() {}
    
    open
    func refreshData() {
        pageNum = pageNumInitialize
        
//        loadData()
    }
    
    open
    func loadMore() {
        pageNum = pageNum + 1
        
//        loadData()
    }
    
    open
    func numberOfSections() -> NSInteger {
        1
    }
    
    open
    func numberOfRows(in section: NSInteger) -> Int {
        dataSource.count
    }
    
    open
    func model(at indexPath: IndexPath) -> ModelProtocol {
        dataSource[indexPath.row]
    }
    
    open
    func height(at indexPath: IndexPath) -> CGFloat {
        dataSource[indexPath.row].height()
    }
    
    open
    func sizeForItem(at indexPath: IndexPath) -> CGSize {
        dataSource[indexPath.row].size()
    }
    
    deinit {
        print("=======================================")
        print("deinit----【\(self)】")
        print("=======================================")
    }
}

extension AbstractTableViewModel {
    // MARK: - 抽象方法
    
    /// 即将更新数据源
    open
    func viewModelWillUpdateDataSource() {}
    
    /// 已经更新数据源
    open
    func viewModelDidUpdateDataSource() {}
}
