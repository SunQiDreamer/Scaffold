//
//  DemoViewModel.swift
//  Scaffold_Example
//
//  Created by 孙琦 on 2021/1/4.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import Scaffold

class DemoViewModel: AbstractTableViewModel {
    
    var query: String = "" {
        didSet {
            refreshData()
        }
    }
    
    lazy var tmps = [DemoModel]()
    
    override func refreshData() {
        super.refreshData()
        loadData()
    }
    
    override func loadData() {
        super.loadData()
        
        for i in 0...10 {
            let model = DemoModel()
            model.title = "index--\(i)"
            tmps.append(model)
        }
        
        dataSource = tmps
    }
}
