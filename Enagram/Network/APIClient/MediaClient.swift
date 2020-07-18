//
//  MediaClient.swift
//  Enagram
//
//  Created by Antoine Subra on 18/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import Foundation

class MediaClient: APIClient {
  static func getMedia(id: String, completion: @escaping (MediaModel) -> Void, error: @escaping () -> Void) {
    performRequest(route: InstagramRouter.getMedia(id: id), completion: completion, error: error)
  }
}
