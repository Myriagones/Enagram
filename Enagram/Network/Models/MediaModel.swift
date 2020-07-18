//
//  MediaModel.swift
//  Enagram
//
//  Created by Antoine Subra on 18/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import Foundation

struct MediaModel: Codable {
  var id: String
  var media_type: String
  var media_url: String
  var timestamp: String
}
