//
//  ImageLoader.swift
//  Enagram
//
//  Created by Perso on 19/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import UIKit

class ImageLoader {
  private var cachedImages = [String: UIImage]()
  private var currentRequests = [UUID: URLSessionDataTask]()
  
  func loadImage(_ url: URL, identifier: String, _ completion: @escaping (Result<UIImage, Error>) -> Void) -> UUID? {

    if let image = cachedImages[identifier] {
      print(identifier)
      completion(.success(image))
      return nil
    }

    let uuid = UUID()

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      
      defer {self.currentRequests.removeValue(forKey: uuid) }

      if let data = data, let image = UIImage(data: data) {
        self.cachedImages[identifier] = image
        completion(.success(image))
        return
      }

      guard let error = error else {
        return
      }

      guard (error as NSError).code == NSURLErrorCancelled else {
        completion(.failure(error))
        return
      }
    }
    task.resume()

    currentRequests[uuid] = task
    return uuid
  }
  
  func cancelLoad(_ uuid: UUID) {
    currentRequests[uuid]?.cancel()
    currentRequests.removeValue(forKey: uuid)
  }
}
