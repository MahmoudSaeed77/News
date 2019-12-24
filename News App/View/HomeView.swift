//
//  HomeView.swift
//  News App
//
//  Created by Mohamed Ibrahem on 10/8/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(tableView)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupLayout(){
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
}
