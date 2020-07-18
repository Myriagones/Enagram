//
//  MediaChildrenClient.swift
//  Enagram
//
//  Created by Antoine Subra on 18/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import Foundation

class MediaChildrenClient: APIClient {
  static func getMediaChildren(
    id: String, completion: @escaping (MediaChildrenModel) -> Void, error: @escaping () -> Void) {
    performRequest(route: InstagramRouter.getMediaChildren(id: id), completion: completion, error: error)
  }
}
