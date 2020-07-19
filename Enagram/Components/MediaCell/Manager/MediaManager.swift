//
//  MediaManager.swift
//  Enagram
//
//  Created by Perso on 19/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import UIKit

class MediaManager {
  
  static func getImages(identifier: String, completion: @escaping ([MediaModelView]) -> Void, error: @escaping () -> Void) {
    MediaClient.getMedia(id: identifier, completion: { (media) in
      let media = MediaModelView(media: media)
      switch media.type {
      case .image:
        completion([media])
      case .group:
        // Load children
        // Download images
        // complete models
        print("group")
      }
    }, error: error)
  }
}
