//
//  MediaAPIClient.swift
//  appleMediaSV
//
//  Created by C4Q on 2/24/19.
//  Copyright © 2019 C4Q. All rights reserved.
//

import Foundation
import UIKit

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

class ImageAPIClient {
    static let client = ImageAPIClient()
    private init() {}
    public func GetOnlineImages(with urlStr: String, onCompletion: @escaping (UIImage) -> Void, onError: @escaping (Error) -> Void ) {
        
        guard let url = URL(string: urlStr) else {
            print("Bad image url!")
            return}
        let request = URLRequest(url: url)
        let completion: (Data) -> Void = {(data) in
            guard let image = UIImage(data: data) else {
                print("bad image data!")
                return}
            onCompletion(image)
        }
        NetworkHelper.share.performDataTask(with: request, completionHandler: completion, errorHandler: onError)
    }
}
