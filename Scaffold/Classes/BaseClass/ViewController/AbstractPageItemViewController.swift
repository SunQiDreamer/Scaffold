//
//  AbstractPageItemViewController.swift
//  MainSearch
//
//  Created by 孙琦 on 2020/7/28.
//  Copyright © 2020 Tigerobo. All rights reserved.
//

import Foundation
import JXPagingView

class AbstractPageItemViewController: AbstractTableViewController {
    var listViewDidScrollCallback: ((UIScrollView) -> ())?
    
    override func beginRefreshEnable() -> Bool { false }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.showsVerticalScrollIndicator = false
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.listViewDidScrollCallback?(scrollView)
    }
}

extension AbstractPageItemViewController: JXPagingViewListViewDelegate {
    func listView() -> UIView {
        view
    }
    
    func listScrollView() -> UIScrollView {
        tableView
    }
    
    func listViewDidScrollCallback(callback: @escaping (UIScrollView) -> ()) {
        self.listViewDidScrollCallback = callback
    }
}
