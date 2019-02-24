//
//  NetworkHelper.swift
//  appleMediaSV
//
//  Created by C4Q on 2/24/19.
//  Copyright © 2019 C4Q. All rights reserved.
//

import Foundation

struct MediaEndPoint {
    static let appleMusicStr = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json"
    static let ituneMusicStr = "https://rss.itunes.apple.com/api/v1/us/itunes-music/hot-tracks/all/10/explicit.json"
}
enum AppError: Error {
    case badData
    case badURL(str: String)
    case codingError(rawError: Error)
    case badStatusCode(num: Int)
    case other(rawError: Error)
}
struct NetworkHelper {
    private init() {}
    static let share = NetworkHelper()
    private let session = URLSession(configuration: .default)
    func performDataTask(with request: URLRequest,
                         completionHandler: @escaping (Data) -> Void,
                         errorHandler: @escaping (AppError) -> Void) {
        session.dataTask(with: request){(data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {errorHandler(AppError.badData); return}
                if let error = error {
                    errorHandler(AppError.other(rawError: error))
                }
                completionHandler(data)
            }
            }.resume()
    }
}
