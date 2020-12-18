//
//  AbstractPageCollectionItemViewController.swift
//  MainSearch
//
//  Created by 孙琦 on 2020/8/11.
//  Copyright © 2020 Tigerobo. All rights reserved.
//

import Foundation
import JXPagingView

class AbstractPageCollectionItemViewController: AbstractCollectionViewController {
    var listViewDidScrollCallback: ((UIScrollView) -> ())?
    
    override func beginRefreshEnable() -> Bool { false }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.showsVerticalScrollIndicator = false
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.listViewDidScrollCallback?(scrollView)
    }
}

extension AbstractPageCollectionItemViewController: JXPagingViewListViewDelegate {
    func listView() -> UIView {
        view
    }
    
    func listScrollView() -> UIScrollView {
        collectionView
    }
    
    func listViewDidScrollCallback(callback: @escaping (UIScrollView) -> ()) {
        self.listViewDidScrollCallback = callback
    }
}
