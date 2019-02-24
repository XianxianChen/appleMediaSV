//
//  MediaAPIClient.swift
//  appleMediaSV
//
//  Created by C4Q on 2/24/19.
//  Copyright © 2019 C4Q. All rights reserved.
//

import Foundation

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
class MediaAPIClient {
    static let client = MediaAPIClient()
    private init() {}
    func getAppleMusics(completionHandler: @escaping ([AppleMusic]) -> Void, errorHandler: @escaping (Error) -> Void) {
        let urlStr = MediaEndPoint.appleMusicStr
        guard let url = URL(string: urlStr) else {
            errorHandler(AppError.badURL(str: urlStr))
            return
        }
        let request = URLRequest(url: url)
        let completion: (Data) -> Void = {(data) in
            do {
                let onlineResult = try JSONDecoder().decode(ResultList.self, from: data)
                let medias = onlineResult.feed.results
                completionHandler(medias)
                
            } catch {
                
            }
        }
        
        NetworkHelper.share.performDataTask(with: request, completionHandler: completion, errorHandler: errorHandler)
        
    }
}
