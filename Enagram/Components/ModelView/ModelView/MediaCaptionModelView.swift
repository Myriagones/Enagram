//
//  MediaCaptionModelView.swift
//  Enagram
//
//  Created by Perso on 19/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import Foundation

class MediaCaptionModelView {
  var identifier: String
  var caption: String?
  
  init(model: MediaCaptionModel) {
    self.identifier = model.id
    self.caption = model.caption
  }
}
