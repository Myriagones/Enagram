//
//  ListMediaManager.swift
//  Enagram
//
//  Created by Perso on 19/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import Foundation

class ListMediaManager {
  static func getMedias(
    completion: @escaping ([MediaCaptionModelView]) -> Void, error: @escaping () -> Void) {
    MediasClient.getMedias(completion: { (medias) in
      var array = [MediaCaptionModelView]()
      for media in medias.data {
        array.append(MediaCaptionModelView(model: media))
      }
      completion(array)
    }, error: error)
  }
}
