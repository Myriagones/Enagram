//
//  APIClient.swift
//  Enagram
//
//  Created by Antoine Subra on 18/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
  @discardableResult
  static func performRequest<T: Decodable>(
    route: URLRequestConvertible, completion: @escaping (T) -> Void,
    error: @escaping () -> Void) -> DataRequest {
    
    let taskId = UIApplication.shared.beginBackgroundTask(expirationHandler: {})
    
    let request = AF.request(route)
    
    return request.responseJSON { (response) in
      switch response.result {
      case .success(_):
        guard let data = response.data, let result = try? JSONDecoder().decode(T.self, from: data) else {
          print("Error: Couldn't decode data into: ", T.self)
          return
        }
        completion(result)
      case .failure(_):
        error()
      }
      
      UIApplication.shared.endBackgroundTask(taskId)
    }
  }
}
