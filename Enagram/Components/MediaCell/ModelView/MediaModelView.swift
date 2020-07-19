//
//  MediaModelView.swift
//  Enagram
//
//  Created by Perso on 19/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import UIKit

enum MediaType: String {
  case image = "image"
  case group = "group"
}

class MediaModelView {
  var identifier: String
  var url: URL?
  var type: MediaType
  var date: Date
  
  init(media: MediaModel) {
    self.identifier = media.id
    self.url = URL(string: media.media_url)
    self.type = .image
    self.date = Date()
  }
}


