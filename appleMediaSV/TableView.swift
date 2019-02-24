//
//  TableView.swift
//  appleMediaSV
//
//  Created by C4Q on 2/24/19.
//  Copyright © 2019 C4Q. All rights reserved.
//

import UIKit

class TableView: UITableView {

        override init(frame: CGRect, style: UITableView.Style) {
            super.init(frame: UIScreen.main.bounds, style: style)
            register(MediaCell.self, forCellReuseIdentifier: "mediaCell")
            setupView()
        }
        required init?(coder aDecoder: NSCoder) {
            fatalError("aDecoder has not been created")
        }
        func setupView() {
            self.backgroundColor = .blue
        }
        
}


