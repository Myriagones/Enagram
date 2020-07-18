//
//  MediasModel.swift
//  Enagram
//
//  Created by Antoine Subra on 18/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import Foundation

struct MediasModel: Codable {
  let data: [MediaCaptionModel]
}

struct MediaCaptionModel: Codable {
  let id: String
  let caption: String?
}
