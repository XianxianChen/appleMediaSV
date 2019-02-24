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
    lazy var mediaImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    lazy var typeLabel: UILabel = {
        let lab = UILabel()
        lab.contentMode = .left
        lab.text = "typeLabel"
        lab.textColor = .gray
        return lab
    }()
    lazy var spiner: UIActivityIndicatorView = {
        let spin = UIActivityIndicatorView(style: .gray)
        return spin
    }()
    func setupViews() {
        addSubview(nameLabel)
        addSubview(typeLabel)
        addSubview(mediaImageView)
        mediaImageView.addSubview(spiner)
        [nameLabel, typeLabel, mediaImageView].forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": typeLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": mediaImageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0(35)]-8-[v1(35)]-8-[v2]-8-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": nameLabel, "v1": typeLabel, "v2": mediaImageView]))
        
        spiner.translatesAutoresizingMaskIntoConstraints = false
        spiner.centerXAnchor.constraint(equalTo: mediaImageView.centerXAnchor).isActive = true
        spiner.centerYAnchor.constraint(equalTo: mediaImageView.centerYAnchor).isActive = true
        spiner.widthAnchor.constraint(equalTo: mediaImageView.widthAnchor).isActive = true
        spiner.heightAnchor.constraint(equalTo: mediaImageView.heightAnchor).isActive = true
        
        
    }

}
