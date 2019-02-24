//
//  AppleMusic.swift
//  appleMediaSV
//
//  Created by C4Q on 2/24/19.
//  Copyright © 2019 C4Q. All rights reserved.
//

import Foundation

// Using codable to parse music json data
struct ResultList: Codable {
    let feed: FeedData
}
struct FeedData: Codable {
    let results: [AppleMusic]
}

struct AppleMusic:  Codable {
    let name: String
    let imageUrl: String
    enum CodingKeys: String, CodingKey {
        case name
        case imageUrl = "artworkUrl100"
    }
}
