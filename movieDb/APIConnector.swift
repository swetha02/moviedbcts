//
//  APIConnector.swift
//  movieDb
//
//  Created by swetha on 10/21/21.
//  Copyright © 2021 swetha. All rights reserved.

import Foundation
class APIConnector: NSObject, NSURLConnectionDelegate {
    
    static func requestData(urlString: String, completionHandler: @escaping (status, Data?) -> Void) {
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
          if let _ = error {
            completionHandler(status.failure, nil)
            return
          }
          guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
            completionHandler(status.failure, nil)
            return
          }
            if let data = data {
            completionHandler(status.success, data)
          }
        })
        task.resume()
      }
}

enum status {
    case success
    case failure
}
