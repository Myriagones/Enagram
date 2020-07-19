//
//  MediaManager.swift
//  Enagram
//
//  Created by Perso on 19/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import UIKit

class MediaManager {
  
  static var cache = [String: [MediaModelView]]()
  
  static func getImages(identifier: String, completion: @escaping ([MediaModelView]) -> Void, error: @escaping () -> Void) {
    
    if let temp = cache[identifier] {
      completion(temp)
      return
    }
    
    MediaClient.getMedia(id: identifier, completion: { (media) in
      let model = MediaModelView(media: media)
      guard let type = model.type else {
        return
      }
      
      switch type {
      case .image:
        MediaManager.cache[identifier] = [model]
        completion([model])
      case .group:
        MediaManager.getChildren(identifier: identifier, completion: completion, error: error)
      }
    }, error: error)
  }
  
  static func getChildren(identifier: String, completion: @escaping ([MediaModelView]) -> Void, error: @escaping () -> Void) {
    if let temp = cache[identifier] {
      completion(temp)
      return
    }
    
    MediaChildrenClient.getMediaChildren(id: identifier, completion: { (children) in
      var temp = [MediaModelView]()
      for media in children.data {
        temp.append(MediaModelView(media: media))
      }
      
      MediaManager.cache[identifier] = temp
      completion(temp)
    }, error: error)
  }
}
