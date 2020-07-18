//
//  MediasClient.swift
//  Enagram
//
//  Created by Antoine Subra on 18/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import Foundation

class MediasClient: APIClient {
  static func getMedias(completion: @escaping (MediasModel) -> Void, error: @escaping () -> Void) {
    performRequest(route: InstagramRouter.getMedias, completion: completion, error: error)
  }
}
