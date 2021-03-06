//
//  MediaModelView.swift
//  Enagram
//
//  Created by Perso on 19/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import UIKit

enum MediaType: String {
  case image = "IMAGE"
  case group = "CAROUSEL_ALBUM"
}

class MediaModelView {
  var identifier: String
  var url: URL?
  var type: MediaType?
  var date: String?
  var image: UIImage?
  
  init(media: MediaModel) {
    self.identifier = media.id
    self.url = URL(string: media.media_url)
    self.type = MediaType(rawValue: media.media_type)
    self.date = media.timestamp.toDate?.readable
  }
}
