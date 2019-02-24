//
//  MediaCell.swift
//  appleMediaSV
//
//  Created by C4Q on 2/24/19.
//  Copyright © 2019 C4Q. All rights reserved.
//

import UIKit

class MediaCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "mediaCell")
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("aDecoder is not been initialized")
        
    }
    lazy var nameLabel: UILabel = {
        let lab = UILabel()
        lab.contentMode = .left
        lab.text = "nameLabel"
        lab.font = UIFont.boldSystemFont(ofSize: 16)
        return lab
    }()
    func setupViews() {
        
    }

}
