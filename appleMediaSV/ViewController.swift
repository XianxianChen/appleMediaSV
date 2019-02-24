//
//  ViewController.swift
//  appleMediaSV
//
//  Created by C4Q on 2/24/19.
//  Copyright © 2019 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let tableView = TableView()
    
    var appleMusics = [AppleMusic]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupView()
        self.tableView.dataSource = self
        loadAppleMusics()
    }
    func setupView() {
        view.addSubview(tableView)
        tableView.frame = UIScreen.main.bounds
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    func loadAppleMusics() {
        MediaAPIClient.client.getAppleMusics(completionHandler: {self.appleMusics = $0}, errorHandler: {_ in print("error loading appleMusics")})
    }

}
extension ViewController:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.appleMusics.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mediaCell", for: indexPath) as! MediaCell
        let index = indexPath.row
        cell.nameLabel.text = appleMusics[index].name
        cell.typeLabel.text = "Apple Music"
        cell.spiner.startAnimating()
        let imageUrlStr = appleMusics[index].imageUrl
        ImageAPIClient.client.GetOnlineImages(with: imageUrlStr, onCompletion:{
            cell.mediaImageView.image = $0
            cell.spiner.stopAnimating()
            cell.spiner.isHidden = true
            cell.layoutIfNeeded()
        }, onError: {_ in print("error loading image")})
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}

